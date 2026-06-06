import '../css/NotFound.css'
import Footer from './Footer';
import Header from './Header';

function NotFound() {
    return(
        <>
        <Header />
        <div className="not-found-page">
            <h2>404</h2>
            <p>Page not found</p>
        </div>
        <Footer />
        </>
    )
}

export default NotFound;