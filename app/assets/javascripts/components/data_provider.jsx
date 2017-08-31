var fetchArticles = (component, urlPath) => {
	const requestHeaders = new Headers();
	requestHeaders.append("Content-Type", "application/json");
	requestHeaders.append("Accept", "application/json");
	const params = {
		method: "POST",
		headers: requestHeaders,
		body: JSON.stringify({
			page: component.state.nextPage,
		}),
	};

	fetch(urlPath, params)
		.then((response) => {
			if (response.ok) {
				return response.json();
			} else {
				console.log(response.statusText);
			}
		})
		.then(response => {
			let articles = component.state.articles.slice();
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

			component.setState({
				allArticlesShown: (articles.length == response.total_count ? true : false),
				articles: articles,
				nextPage: response.next_page,
				isLoading: false,
			});
		});
}