import { Routes, Route } from 'react-router';
import HomePage from './components/HomePage';
import './App.css'
import 'bootstrap/dist/css/bootstrap.min.css';
import RevenueTrends from './components/RevenueTrends';
import ProductsTrends from './components/ProductsTrends';
import DemographicTrends from './components/DemographicsTrends';
import NotFound from './components/NotFound';
import KPIsPage from './components/KPIsPage';

function App() {
  return(
    <Routes>
        <Route index element={<HomePage />} />
        <Route path='/revenue' element={<RevenueTrends />} />
        <Route path='/products' element={<ProductsTrends />} />
        <Route path='/demographics' element={<DemographicTrends />} />
        <Route path='/kpis' element={<KPIsPage />} />
        <Route path='*' element={<NotFound />} />
    </Routes>

  )
}

export default App

// revenue: 1, 3, 6, 8
// product 2, 7, 9
// demographics 4, 5
// kpis 10