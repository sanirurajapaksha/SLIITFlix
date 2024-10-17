package model;

public class Content {

	private int content_id;
	private String title;
	private String content_type;
	private int release_Year;
	private String genre;
	private int rating;
	private String description;
	private String director;
	
	
	
	public Content() {
		
	}


	//Overloaded constructor
	public Content(int content_id, String title, String content_type, int release_Year, String genre, int rating,
			String description, String director) {
		super();
		this.content_id = content_id;
		this.title = title;
		this.content_type = content_type;
		this.release_Year = release_Year;
		this.genre = genre;
		this.rating = rating;
		this.description = description;
		this.director = director;
	}


	//Getters
	public int getContent_id() {
		return content_id;
	}


	public String getTitle() {
		return title;
	}


	public String getContent_type() {
		return content_type;
	}


	public int getRelease_Year() {
		return release_Year;
	}


	public String getGenre() {
		return genre;
	}


	public int getRating() {
		return rating;
	}


	public String getDescription() {
		return description;
	}


	public String getDirector() {
		return director;
	}

	
	

	//setters
	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public void setContent_type(String content_type) {
		this.content_type = content_type;
	}


	public void setRelease_Year(int release_Year) {
		this.release_Year = release_Year;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}


	public void setRating(int rating) {
		this.rating = rating;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public void setDirector(String director) {
		this.director = director;
	}


}
