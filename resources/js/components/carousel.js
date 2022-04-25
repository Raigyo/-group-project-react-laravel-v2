import React, { Component } from "react";
import Carousel from "react-bootstrap/Carousel";

export default class CarouselContent extends Component {
    render() {
        return (
            <div>
                <Carousel>
                    <Carousel.Item>
                        <img
                            className="d-block w-100"
                            src="images/carousel/img1.jpg"
                            alt="First slide"
                        />
                        <Carousel.Caption>
                            <h3>Find the best events around you</h3>
                        </Carousel.Caption>
                    </Carousel.Item>
                    <Carousel.Item>
                        <img
                            className="d-block w-100"
                            src="images/carousel/img2.jpg"
                            alt="Second slide"
                        />

                        <Carousel.Caption>
                            <h3>Add your event here</h3>
                        </Carousel.Caption>
                    </Carousel.Item>
                    <Carousel.Item>
                        <img
                            className="d-block w-100"
                            src="images/carousel/img3.jpg"
                            alt="Third slide"
                        />

                        <Carousel.Caption>
                            <h3>Find where to go out</h3>
                        </Carousel.Caption>
                    </Carousel.Item>
                </Carousel>
            </div>
        );
    }
}
