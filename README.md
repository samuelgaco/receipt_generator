```
git clone git@github.com:samuelgaco/receipt_generator.git
```

Commands to run the project locally:


```
bundle install
ruby main.rb
```

You can add new files to the `/inputs` folder to generate new receipts.


Run tests with:

```
rspec spec
```


## Output example

```
item.pvp: book at 24.98
item.pvp: music CD at 16.49
item.pvp: chocolate bar at 0.85
Sales Taxes: 1.5
Total: 42.32

item.pvp: imported box of chocolates at 10.5
item.pvp: imported bottle of perfume at 54.65
Sales Taxes: 7.65
Total: 65.15

item.pvp: imported bottle of perfume at 32.19
item.pvp: bottle of perfume at 20.89
item.pvp: packet of headache pills at 9.75
item.pvp: imported boxes of chocolates at 35.55
Sales Taxes: 6.7
Total: 98.38
```
