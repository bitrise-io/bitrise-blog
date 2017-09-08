const requestHeaders = new Headers();
requestHeaders.append("Content-Type", "application/json");
requestHeaders.append("Accept", "application/json");

var fetchArticles = (component, urlPath, queryParam=null) => {
	let rawBody = {
		page: component.state.nextPage,
	};
	if (queryParam) {
		rawBody.query = queryParam;
	}
	const params = {
		method: "POST",
		headers: requestHeaders,
		body: JSON.stringify(rawBody),
	};
	component.setState({isLoading: true}, () => {
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
					const articleCategory = anArticleData.categories.length > 0 ? anArticleData.categories[0].table.name : "";
					article = {
						category: articleCategory,
						featuredImage: anArticleData.featured_image,
						link: `/${anArticleData.slug}`,
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
	});
};

var subscribeUserToNewsletter = (email) => {
	const params = {
		method: "POST",
		headers: requestHeaders,
		body: JSON.stringify({
			email: email,
		}),
	};

	return fetch("/subscribe_user", params)
		.then((response) => {
			return response.json();
		})
		.then((json) => {
			return json.message;
		});
};
