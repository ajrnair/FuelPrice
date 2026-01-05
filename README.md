# 🚗 Fuel Prices India

A minimal, modern website that displays current Petrol and Diesel rates from all Indian states and Union Territories. Built specifically for road trippers with useful tools and optimized for low bandwidth.

![License](https://img.shields.io/badge/license-MIT-blue.svg)

## ✨ Features

### 📊 Real-time Fuel Prices
- **All 28 States**: Complete coverage of Indian states
- **8 Union Territories**: Including Delhi, Puducherry, and more
- **Daily Updates**: Prices updated from official sources
- **Clear Display**: Easy-to-read price cards with state-wise breakdown

### 🛣️ Road Tripper Tools

#### Route Fuel Calculator
Calculate exact fuel costs for your journey:
- Input distance and vehicle mileage
- Select state and fuel type
- Get instant cost estimates
- Plan your budget accurately

#### Price Comparison
Compare fuel prices between any two states:
- Side-by-side comparison
- See exact price differences
- Make informed refueling decisions
- Save money on long trips

#### Smart Search
- Quick search across all states
- Real-time filtering
- Find your location instantly

### 📈 City Diesel Comparison
- **Bangalore**: Karnataka diesel prices
- **Kochi**: Kerala diesel prices
- **Coimbatore**: Tamil Nadu diesel prices
- **Goa**: Goa diesel prices
- Perfect for South India road trippers!
- **Last Updated**: Always know data freshness

## 🚀 Quick Start

### Option 1: Simple File Serving (Zero Configuration)

Just open the `index.html` file in your browser:

```bash
# Using Python (recommended)
python3 -m http.server 8000

# Or using Node.js
npx serve

# Then open: http://localhost:8000
```

### Option 2: Deploy to GitHub Pages

1. Fork this repository
2. Go to Settings → Pages
3. Select branch `main` and folder `/` (root)
4. Your site will be live at: `https://yourusername.github.io/Drugs/`

### Option 3: Deploy to Netlify/Vercel

Simply drag and drop the folder or connect your GitHub repo!

## 🔧 Data Updates

### ⚡ Automated Daily Updates (Recommended)

The repository includes **GitHub Actions** that automatically update fuel prices **every day at 6:30 AM IST**!

**How it works:**
- Scraper runs automatically via GitHub Actions
- Fetches real-time prices from multiple sources:
  - **NDTV** (primary source)
  - **GoodReturns** (fallback)
  - **MyPetrolPrice** (secondary fallback)
- Updates `data.json` with latest prices
- Commits changes automatically
- GitHub Pages auto-deploys the updated site

**To enable:** Just push the code to GitHub - the workflow runs automatically!

**Manual trigger:** Go to Actions tab → "Update Fuel Prices" → "Run workflow"

### 🔄 Manual Scraping

Run the scraper manually anytime:

```bash
# Install dependencies
pip install -r requirements.txt

# Run full scraper (all states)
python3 scraper.py

# Run quick test (4 states only)
python3 test_scraper.py
```

### ✏️ Manual Data Edit

You can also edit `data.json` directly with custom prices.

### 📊 Data Sources

The scraper uses multiple sources with automatic failover:
1. **NDTV Fuel Prices** - City-specific prices (e.g., https://www.ndtv.com/fuel-prices/diesel-price-in-ernakulam-city)
2. **GoodReturns** - State-wise aggregated data
3. **MyPetrolPrice** - Alternative city data
4. **Fallback estimation** - If all sources fail, uses reasonable estimates

## 📱 Low Bandwidth Optimization

Perfect for users with limited connectivity:

✅ **Inline CSS** - No external stylesheet requests
✅ **No Images** - Uses emoji and Unicode
✅ **No Frameworks** - Vanilla JavaScript only
✅ **System Fonts** - No web font downloads
✅ **Minimal JS** - ~3KB uncompressed
✅ **Total Size** - Under 15KB for entire page

## 🎨 Design Philosophy

- **Minimal**: Clean interface without clutter
- **Modern**: Contemporary design patterns
- **Responsive**: Works on all device sizes
- **Fast**: Loads in <1 second on 2G
- **Accessible**: Semantic HTML, readable fonts
- **Delightful**: Smooth interactions, useful tools

## 📊 Data Structure

```json
[
  {
    "state": "State Name",
    "petrol": "102.84",
    "diesel": "94.28",
    "updated": "2026-01-05"
  }
]
```

## 🛠️ Technology Stack

- **HTML5** - Semantic markup
- **CSS3** - Modern styling with CSS Grid/Flexbox
- **Vanilla JavaScript** - No dependencies
- **Python 3** - Data scraping (optional)

## 🌟 Use Cases

Perfect for:
- **Road Trippers**: Plan fuel costs for cross-country trips
- **Truck Drivers**: Find cheapest refueling points
- **Fleet Managers**: Track fuel expense variations
- **Budget Travelers**: Optimize route costs
- **General Public**: Stay informed about fuel prices

## 🤝 Contributing

Contributions welcome! To add features:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Ideas for Contribution
- Integrate real-time API for automatic price updates
- Add historical price trends
- Create mobile app version
- Add more languages (Hindi, Tamil, etc.)
- Implement PWA features for offline access
- Add fuel station locator integration

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- Fuel price data sourced from official petroleum authorities
- Built for the Indian road tripper community
- Designed with love for minimal, functional interfaces

## 📞 Support

For issues, questions, or suggestions:
- Open an issue on GitHub
- Submit a pull request
- Star the repo if you find it useful!

---

**Made with ❤️ for Indian Road Trippers 🇮🇳**

*Last updated: January 2026*
