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