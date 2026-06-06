import { NavLink } from 'react-router'
import '../css/Header.css'

function Header(){
    const navLinkClass = ({ isActive }) => isActive ? 'nav-link active' : 'nav-link'
    return(
        <div className="header-container">
            <nav className="navbar navbar-expand-lg">
                <div className="container-fluid">
                    <NavLink className="navbar-brand" to="/">Dashboard</NavLink>
                    <div className="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                        <ul className="navbar-nav mb-2 mb-lg-0">
                            <li className="nav-item">
                                <NavLink className={navLinkClass} to="/">Home</NavLink>
                            </li>
                            <li className="nav-item">
                                <NavLink className={navLinkClass} to="/revenue">Revenue</NavLink>
                            </li>
                            <li className="nav-item">
                                <NavLink className={navLinkClass} to="/products">Products Analysis</NavLink>
                            </li>
                            <li className="nav-item">
                                <NavLink className={navLinkClass} to="/demographics">Demographics</NavLink>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    )
}

export default Header