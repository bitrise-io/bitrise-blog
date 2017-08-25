const Article = (props) => {
	return (
		<div className="article-container" key={props.data.slug}>
			<div className="header-container">
				<p className="category">{props.data.category}</p>
				<p className="date">{props.data.publishDate}</p>
			</div>

			<div className="image-container">
				<img src={props.data.featuredImage} />
			</div>

			<div className="article">
				<h2>
					<a href={props.data.link} title={props.data.title} >{props.data.title}</a>
				</h2>
				<p>{props.data.summary}</p>
			</div>
		</div>
	);
}

class Articles extends React.Component {
	constructor() {
		super();
		this.state = {
			articles: [],
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
		this.fetchArticles(null);
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

				<div className="default-button load-more">
					<a onClick={() => this.loadAllPosts()}>View all articles</a>
				</div>
			</div>
		);
	}
}