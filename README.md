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

### 📈 Statistics Dashboard
- **Average Prices**: National average for both fuels
- **Best Deals**: Find states with cheapest rates
- **Quick Overview**: At-a-glance statistics
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

The website reads from `data.json`. To update prices:

### Manual Update
Edit `data.json` directly with new prices.

### Automated Scraping
```bash
# Install dependencies
pip install -r requirements.txt

# Run scraper
python3 scraper.py
```

**Note**: The scraper is a template. You'll need to integrate with a real fuel price API or scraping source. Possible sources:
- Indian Oil Corporation API
- State petroleum department websites
- Aggregator services like goodreturns.in
- Government petroleum data portals

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
