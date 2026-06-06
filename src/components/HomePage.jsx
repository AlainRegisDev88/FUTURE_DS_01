import Header from "./Header"
import '../css/HomePage.css'
import revenueTrendsImage from '../assets/images/revenue-trends.jpg'
import demographicTrendsImage from '../assets/images/demographic-trends.jpg'
import productsTrendsImage from '../assets/images/products-trends.jpg'
import { Link } from "react-router"
import Footer from "./Footer"

export default function HomePage() {
    return (
        <>
            <Header />
            <div className="container">
            <div className="home-content">
                <div className="home-title-container">
                    <h4 className="home-title">Dashboard</h4>
                </div>
                <div className="cards-container">
                    <div className="card">
                        <img src={revenueTrendsImage} className="card-img-top" alt="Im" />
                        <div className="card-body">
                            <h5 className="card-title">Revenue Trends</h5>
                            <p className="card-text">Amnalysis on how revenue trends relates with other metrics</p>
                            <Link to ="/revenue" className="btn btn-primary">View Trends</Link> 
                        </div>
                    </div>
                    <div className="card">
                        <img src={productsTrendsImage} className="card-img-top" alt="Im" />
                        <div className="card-body">
                            <h5 className="card-title">Products Information</h5>
                            <p className="card-text">Analysis of product information and how it relates to other metrics.</p>
                            <Link to ="products" className="btn btn-primary">View Porducts Trends</Link> 
                        </div>
                    </div>
                    <div className="card">
                        <img src={demographicTrendsImage} className="card-img-top" alt="Im" />
                        <div className="card-body">
                            <h5 className="card-title">Demographics</h5>
                            <p className="card-text">Analysis of the customer background and countries' analysis.</p>
                            <Link to ="demographics" className="btn btn-primary">View Demographics</Link> 
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <Footer />
        </>
    )
}