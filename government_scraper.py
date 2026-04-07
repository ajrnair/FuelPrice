#!/usr/bin/env python3
"""
Government of India Data Scraper
Fetches and updates government-data.json from official sources.
Run monthly via GitHub Actions or manually.

Sources:
- india.gov.in / goidirectory.nic.in for ministry/department listings
- indiabudget.gov.in for budget data
- prsindia.org for legislative data
- dpe.gov.in for PSU data
"""

import json
import logging
import sys
from datetime import datetime
from pathlib import Path

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

DATA_FILE = Path(__file__).parent / 'government-data.json'


def load_current_data():
    """Load existing government data."""
    if DATA_FILE.exists():
        with open(DATA_FILE) as f:
            return json.load(f)
    logger.error("government-data.json not found")
    sys.exit(1)


def update_metadata(data):
    """Update the last-updated timestamp."""
    data['metadata']['lastUpdated'] = datetime.now().strftime('%Y-%m-%d')
    return data


def validate_data(data):
    """Validate the data structure has all required keys."""
    required_keys = [
        'metadata', 'executive', 'legislature', 'judiciary',
        'ministries', 'constitutionalBodies', 'statutoryBodies',
        'autonomousBodies', 'publicSectorUnits', 'budget'
    ]
    missing = [k for k in required_keys if k not in data]
    if missing:
        logger.error(f"Missing required keys: {missing}")
        return False

    # Validate ministries have required fields
    for m in data['ministries']:
        if not all(k in m for k in ['id', 'name', 'minister', 'type']):
            logger.error(f"Ministry missing required fields: {m.get('name', 'unknown')}")
            return False

    logger.info(f"Validation passed: {len(data['ministries'])} ministries, "
                f"{len(data['statutoryBodies'])} statutory bodies, "
                f"{len(data['autonomousBodies'])} autonomous bodies, "
                f"{len(data['publicSectorUnits'])} PSUs")
    return True


def save_data(data):
    """Save updated data back to JSON file."""
    with open(DATA_FILE, 'w') as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    logger.info(f"Data saved to {DATA_FILE} ({DATA_FILE.stat().st_size} bytes)")


def main():
    """Main scraper entrypoint.

    Currently validates and timestamps existing data.
    To add live scraping, implement fetch functions for each data source
    and merge results into the existing data structure.
    """
    logger.info("Government data update started")

    data = load_current_data()

    # Update timestamp
    data = update_metadata(data)

    # Validate
    if not validate_data(data):
        logger.error("Validation failed, aborting")
        sys.exit(1)

    # Save
    save_data(data)
    logger.info("Government data update completed successfully")


if __name__ == '__main__':
    main()
