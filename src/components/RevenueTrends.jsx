import Header from "./Header"
import '../css/RevenueTrends.css'
import revenueTrendsImage from '../assets/analysis images/01_revenue_trends.png'
import monthlyTransactionsImage from '../assets/analysis images/03_monthly_transactions.png'
import cumulativeRevenue from '../assets/analysis images/06_cumulative_revenue.png'
import quarterlyRevenue from '../assets/analysis images/08_quarterly_revenue.png'
import Footer from "./Footer"


export default function RevenueTrends() {
    return (
        <>
            <Header />
            <div className="page-body">
                <div className="block">
                    <div className="image">
                        <img src={revenueTrendsImage} alt="" />
                    </div>
                    <div className="analysis-content">
                        <div className="analysis title">
                            <h3>Monthly Revenue Trends</h3>
                        </div>
                        <div className="analysis-conntent">
                            <p>The business demonstrates strong seasonal patterns with revenue fluctuating between $450k–$600k in the first three quarters, followed by a dramatic spike in October–November reaching $1M+. The sharp decline in December ($350k) suggests either data truncation or post-holiday retail slowdown. Clear opportunity exists to sustain Q4 momentum into early year periods.</p>
                        </div>
                    </div>
                </div>
                <div className="block">
                    <div className="image">
                        <img src={monthlyTransactionsImage} alt="" />
                    </div>
                    <div className="analysis-content">
                        <div className="analysis title">
                            <h3>Sales Transactions per Month</h3>
                        </div>
                        <div className="analysis-conntent">
                            <p>Transaction volume remains consistent at 20k–30k orders monthly through August, then accelerates dramatically starting September (40k), peaking at 64k orders in November. This 3x surge during Q4 holiday season indicates strong seasonal demand. December's sharp drop reflects either holiday cutoff dates or incomplete data capture.</p>
                        </div>
                    </div>
                </div>
                <div className="block">
                    <div className="image">
                        <img src={cumulativeRevenue} alt="" />
                    </div>
                    <div className="analysis-content">
                        <div className="analysis title">
                            <h3>Cumulative Revenue Over Time</h3>
                        </div>
                        <div className="analysis-conntent">
                            <p>Revenue accumulated linearly throughout 2011, reaching $8.3M cumulatively by year-end. This consistent growth trajectory with no seasonal dips indicates healthy underlying demand stability and provides an advantage for forecasting and resource planning.</p>
                        </div>
                    </div>
                </div>
                <div className="block">
                    <div className="image">
                        <img src={quarterlyRevenue} alt="" />
                    </div>
                    <div className="analysis-content">
                        <div className="analysis title">
                            <h3>Quarterly Revenue Comparison</h3>
                        </div>
                        <div className="analysis-conntent">
                            <p>Revenue shows consistent quarter-over-quarter growth: Q1 ($513k) → Q2 ($1.45M) → Q3 ($1.65M) → Q4 ($2.05M) → Q1 2012 ($2.45M partial). This 5x acceleration from Q1 to Q4 reflects strong seasonal scaling and sustained momentum entering the next year.</p>
                        </div>
                    </div>
                </div>
            </div>
            <Footer />
        </>

    )

}

