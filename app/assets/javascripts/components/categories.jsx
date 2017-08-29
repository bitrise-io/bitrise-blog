const Category = (props) => {
	let classes = "category";
	classes += props.visible ? "" : "";
	return (
		<a href={props.data.path} title={props.data.name} className={classes} >{props.data.name}</a>
	);
}

class Categories extends React.Component {
	constructor() {
		super();
		this.state = {
			dropDownOpened: false,
		}
	}

	onSelectCategory() {
		const dropDownOpened = !this.state.dropDownOpened;
		this.setState({dropDownOpened});
	}

	render() {
		const dropDownOpened = this.state.dropDownOpened;
		let contentWrapperClasses = "content-wrapper";
		contentWrapperClasses += dropDownOpened ? " opened" : "";

		const categories = this.props.categories.map((categoryData) => {
			const category = (
				<Category data={categoryData} visible={dropDownOpened} />
			);
			return (
				category
			);
		});

		return (
			<div className="categories">
				<div className={contentWrapperClasses}>
					{categories}
					<button className="category-select" onClick={() => this.onSelectCategory()}>select category...</button>
				</div>
			</div>
		);
	}
}