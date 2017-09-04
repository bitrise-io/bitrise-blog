class SearchArticles extends React.Component {
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
		this.loadMorePosts();
	}
	loadMorePosts() {
		const urlPath = `/posts/search`;
		fetchArticles(this, urlPath, this.props.searchQuery);
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

				<div className="default-button load-more" hidden={this.state.allArticlesShown || this.state.isLoading}>
					<a onClick={() => this.loadMorePosts()}>Load more</a>
				</div>
			</div>
		);
	}
}