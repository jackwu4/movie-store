/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Assignment2;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Winston chenn
 */
public class Movie implements Serializable{
    
    private int movieID;
    private String title;
    private String director;
    private Double price;
    private String genre;
    private int rating;
    private Date releaseDate;
    private int stock;
    private int movieLength;

    public Movie(int movieID, String title, String director, Double price, String genre, int rating, Date releaseDate, int stock, int movieLength)  {
        this.movieID = movieID;
        this.title = title;
        this.director = director;
        this.price = price;
        this.genre = genre;
        this.rating = rating;
        this.releaseDate = releaseDate;
        this.stock = stock;
        this.movieLength = movieLength;
    }
    
    
    public Movie()  {   }
    
    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getMovieLength() {
        return movieLength;
    }

    public void setMovieLength(int movieLength) {
        this.movieLength = movieLength;
    }

}
