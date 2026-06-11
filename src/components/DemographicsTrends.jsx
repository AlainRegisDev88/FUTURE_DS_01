import Header from "./Header"
import countriesRevenueImage from '../assets/analysis images/04_countries_revenue.png'
import averageOrderValueByCountry from '../assets/analysis images/05_aov_by_country.png'
import Footer from './Footer'

export default function DemographicTrends() {
    return (
        <>
            <Header />
            <div className="page-body">
                <div className="block">
                    <div className="image">
                        <img src={countriesRevenueImage} alt="" />
                    </div>
                    <div className="analysis-content">
                        <div className="analysis title">
                            <h3>Top 15 Countries by Revenue</h3>
                        </div>
                        <div className="analysis-conntent">
                            <p>The United Kingdom dominates with $8.8M in revenue, representing 86% of total sales. All other top-14 markets combined generate only $1.5M. This extreme geographic concentration indicates massive dependency on UK market performance and significant whitespace opportunity in untapped international regions.</p>
                        </div>
                    </div>
                </div>
                <div className="block">
                    <div className="image">
                        <img src={averageOrderValueByCountry} alt="" />
                    </div>
                    <div className="analysis-content">
                        <div className="analysis title">
                            <h3>Top 10 Countries by Average Order Value</h3>
                        </div>
                        <div className="analysis-conntent">
                            <p>Netherlands leads AOV at $2,500, followed by Australia ($2,000) and Lebanon (~$1,800)—all 6–7x higher than the UK's implied AOV (~$373). Premium pricing or bulk ordering in these markets suggests opportunity to expand premium product offerings and improve margin strategy in high-AOV geographies.</p>
                        </div>
                    </div>
                </div>
            </div>
            <Footer />

        </>
    )
}