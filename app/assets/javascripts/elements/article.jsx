const Article = (props) => {
	return (
		<div className="article-container" key={props.data.slug}>
			<a href={props.data.link} title={props.data.title} >
				<div className="header-container">
					<p className="category">{props.data.category}</p>
					<p className="date">{props.data.publishDate}</p>
				</div>

				<div className="image-container" style={{backgroundImage: "url(" + (props.data.featuredImage == null ? props.defaultImagePath : props.data.featuredImage) + ")"}}></div>

				<div className="article">
					<h2>
						{props.data.title}
					</h2>
					<p>{props.data.summary}</p>
				</div>
			</a>
		</div>
	);
}