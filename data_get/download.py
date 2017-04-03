import os
import csv
import requests

from bs4 import BeautifulSoup


dir_path = os.path.dirname(os.path.realpath(__file__))
save_dir = os.path.join(dir_path, '..', 'data_source')


def download():
    urls = {'reddit_archive': 'https://docs.google.com/spreadsheets/d/1X1HTxkI6SqsdpNSkSSivMzpxNT-oeTbjFFDdEkXD30o/export?format=csv&id=1X1HTxkI6SqsdpNSkSSivMzpxNT-oeTbjFFDdEkXD30o&gid=695409533',
            'va_prices': 'https://www.abc.virginia.gov/library/products/other-documents/price-list-excel.csv?la=en'
           }
    for name, url in urls.items():
        file_path = os.path.join(save_dir, '{}.csv'.format(name))
        with open(file_path, 'wb') as handle:
            response = requests.get(url, stream=True)
            if response.ok:
                for block in response.iter_content(1024):
                    handle.write(block)


def scrape():
    urls = ['http://www.proof66.com/liquor/american-whiskey.html',
            'http://www.proof66.com/liquor/canadian-whisky.html',
            'http://www.proof66.com/liquor/irish-whiskey.html',
            'http://www.proof66.com/liquor/international-whisky.html',
            'http://www.proof66.com/liquor/scotch-whisky.html']

    final_rows = []
    for url in urls:
        r = requests.get(url)
        soup = BeautifulSoup(r.text, 'html5lib')
        category_grid = soup.find_all("section", {"id": "categorygrid"})
        section = category_grid[0].select("div[class=row]")
        headers = ["Name", "Rating", "Rabble", "Price"]
        for s in range(len(section)):
            cells = section[s].find_all("span", {"class": "font14s480"})
            name = cells[0].get_text()
            rating = cells[1].get_text()
            rabble = cells[2].get_text()
            price = cells[3].get_text()
            final_rows.append([name, rating, rabble, price])

    file_path = os.path.join(save_dir, 'proof66.csv')
    with open(file_path, 'w') as f:
        writer = csv.writer(f)
        writer.writerow(headers)
        for row in final_rows:
            writer.writerow(row)


if __name__ == '__main__':

    download()
    scrape()
