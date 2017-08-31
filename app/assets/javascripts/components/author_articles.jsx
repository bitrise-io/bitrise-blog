class AuthorArticles extends React.Component {
	constructor() {
		super();
		this.state = {
			articles: [],
			nextPage: 1,
			allArticlesShown: false,
			isLoading: false,
		};
	}
	componentDidMount() {
		const urlPath = "/authors/" + this.props.author.slug + "/posts";
		fetchArticles(this, urlPath);
	}
	loadMorePosts() {
		const urlPath = "/authors/" + this.props.author.slug + "/posts";
		this.setState({isLoading: true}, () => {
			fetchArticles(this, urlPath);
		});
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

				<Progress visible={this.state.isLoading} />

				<div className="default-button load-more" hidden={this.state.allArticlesShown}>
					<a onClick={() => this.loadMorePosts()}>Load more</a>
				</div>
			</div>
		);
	}
}