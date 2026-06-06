import Header from "./Header";
import topProducts from '../assets/analysis images/02_top_products.png'
import topProductsDistribution from '../assets/analysis images/07_top_products_distribution.png'
import topUnitsSold from '../assets/analysis images/09_top_units_sold.png'
import '../css/ProductsRevenue.css'
import Footer from "./Footer";

export default function ProductsTrends() {
    return (
        <>
            <Header />
            <div className="page-body">

                <div className="block">
                    <div className="image">
                        <img src={topProducts} alt="" />
                    </div>
                    <div className="analysis-content">
                        <div className="analysis title">
                            <h3>Top 15 Products by Revenue</h3>
                        </div>
                        <div className="analysis-conntent">
                            <p>Regency Cakestand 3 Tier is the revenue champion, generating ~$120k alone—a 20% concentration in a single SKU. The top 3 products represent approximately 35% of total product revenue. This heavy product concentration creates both opportunity (focus marketing on proven winners) and risk (inventory and demand dependency).</p>
                        </div>
                    </div>
                </div>
                <div className="block">
                    <div className="image">
                        <img src={topProductsDistribution} alt="" />
                    </div>
                    <div className="analysis-content">
                        <div className="analysis title">
                            <h3>Top 10 Products - Revenue Distribution</h3>
                        </div>
                        <div className="analysis-conntent">
                            <p>The top 10 products represent a concentrated revenue pool, with Regency Cakestand, White Hanging Heart, and Jumbo Bag Red Retrospot dominating. This concentration simplifies inventory and marketing focus but indicates a tail of underperformers. Strategic question: optimize the winners or develop emerging products?</p>
                        </div>
                    </div>
                </div>
                <div className="block">
                    <div className="image">
                        <img src={topUnitsSold} alt="" />
                    </div>
                    <div className="analysis-content">
                        <div className="analysis title">
                            <h3>Top 15 Products by Quantity Sold</h3>
                        </div>
                        <div className="analysis-conntent">
                            <p>Volume leaders differ markedly from revenue leaders: World War 2 Gliders (60k+ units) drives volume while generating lower revenue per unit, contrasting with Regency Cakestand's high-margin profile. This split reveals distinct customer segments—value/bulk buyers vs. premium purchasers.</p>
                        </div>
                    </div>
                </div>
            </div>
            <Footer />
        </>
    )
}