import Header from "./Header"
import KPISummaryImage from '../assets/analysis images/10_kpi_summary.png'
import '../css/KPIsPage.css'
import Footer from "./Footer"
 
export default function KPIsPage() {
    return (
        <>
            <Header />
            <div className="page-body">

                <div className="block-kpis">
                    <div className="image">
                        <img src={KPISummaryImage} alt="" />
                    </div>
                    {/* <div className="analysis-content">
                        <div className="analysis title">
                            <h3>Title</h3>
                        </div>
                        <div className="analysis-conntent">
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dicta error consectetur sint vel, esse nulla velit mollitia provident blanditiis, minus consequuntur nostrum cupiditate? Reprehenderit necessitatibus repellendus modi. Ex, inventore quisquam.</p>
                        </div>
                    </div> */}
                </div>
            </div>
            <Footer />
        </>
    )
}