class Articles extends React.Component {
	constructor() {
		super();
		this.state = {
			articles: [],
			allArticlesShown: false,
		};
		this.fetchArticles();
	}
	fetchArticles(page=1) {
		const requestHeaders = new Headers();
		requestHeaders.append("Content-Type", "application/json");
		requestHeaders.append("Accept", "application/json");

		const params = {
			method: "POST",
			headers: requestHeaders,
			body: JSON.stringify({
				page: page,
			}),
		};
		fetch("/posts/list", params)
			.then((response) => {
				if (response.ok) {
					return response.json();
				} else {
					console.log(response.statusText);
				}
			})
			.then(response => {
				const articles = this.state.articles.slice();
				response.forEach((anArticleData) => {
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
				this.setState({articles});
			});
	}
	loadAllPosts() {
		const allArticlesShown = true;
		this.fetchArticles(null);
		this.setState({allArticlesShown});
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
					<a onClick={() => this.loadAllPosts()}>View all articles</a>
				</div>
			</div>
		);
	}
}