class AuthorArticles extends React.Component {
	constructor() {
		super();
		this.state = {
			articles: [],
			nextPage: 1,
			allArticlesShown: false,
		};
	}
	componentDidMount() {
		this.fetchArticles();
	}
	fetchArticles() {
		const requestHeaders = new Headers();
		requestHeaders.append("Content-Type", "application/json");
		requestHeaders.append("Accept", "application/json");
		const params = {
			method: "POST",
			headers: requestHeaders,
			body: JSON.stringify({
				page: this.state.nextPage,
			}),
		};
		var urlPath = "/authors/" + this.props.author.slug + "/posts";

		fetch(urlPath, params)
			.then((response) => {
				if (response.ok) {
					return response.json();
				} else {
					console.log(response.statusText);
				}
			})
			.then(response => {
				console.log(response)
				const articles = this.state.articles.slice();
				response.posts.forEach((anArticleData) => {
					article = {
						category: anArticleData.categories[0].table.name,
						featuredImage: anArticleData.featured_image,
						link: "/" + anArticleData.slug,
						publishDate: formatDate(anArticleData.published),
						slug: anArticleData.slug,
						summary: anArticleData.summary,
						title: anArticleData.title,
					};
					if (!_.find(articles, {slug: article.slug})) {
						articles.push(article);
					}
				});
				if (articles.length == response.total_count) {
					const allArticlesShown = true;
					this.setState({allArticlesShown});
				}
				const nextPage = response.next_page;

				this.setState({articles});
				this.setState({nextPage});
			});
	}
	loadMorePosts() {
		this.fetchArticles();
	}
	render() {
		const articles = this.state.articles.map((articleData) => {
			const article = (
				<Article data={articleData} />
			);
			return (
				article
			);
		});
		return (
			<div>
				<div id="articles-container" className="articles">{articles}</div>

				<div className="default-button load-more" hidden={this.state.allArticlesShown}>
					<a onClick={() => this.loadMorePosts()}>Load more</a>
				</div>
			</div>
		);
	}
}