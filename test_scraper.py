#!/usr/bin/env python3
"""
Quick test script to verify scraper works for a few states
"""

import json
from scraper import fetch_state_prices, STATES

def test_scraper():
    """Test scraper with a few states"""
    test_states = ["Karnataka", "Kerala", "Goa", "Tamil Nadu"]

    print("Testing scraper with sample states...")
    print("=" * 50)

    results = []
    for state in test_states:
        print(f"\nTesting {state}...")
        result = fetch_state_prices(state)
        if result:
            results.append({
                "state": state,
                "petrol": result['petrol'],
                "diesel": result['diesel'],
                "source": result['source']
            })
            print(f"  ✓ Success! Petrol: ₹{result['petrol']}, Diesel: ₹{result['diesel']} (from {result['source']})")
        else:
            print(f"  ✗ Failed to fetch data for {state}")

    print("\n" + "=" * 50)
    print(f"\nResults: {len(results)}/{len(test_states)} states fetched successfully")

    if results:
        print("\nSample data:")
        print(json.dumps(results, indent=2))

    return results

if __name__ == "__main__":
    test_scraper()
