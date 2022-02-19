# BTC-price
Bitcoin price viewer module for polybar

### Screenshots
![screenshot1](/screenshot1.png?raw=true "screenshot")
![screenshot2](/screenshot2.png?raw=true "screenshot")

### Installation
```
git clone `https://github.com/matias-alejandro/BTC-price.git`
cd BTC-price
./install.sh
```
in your polybar's `.ini` file add the following
```
;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

[module/BTC-price]
type = custom/script
interval = 30

format = <label>
format-foreground = #9090a7

format-prefix = " "
format-prefix-foreground = #fedd49

exec = ~/.config/polybar/scripts/BTC-price/BTC-price.sh

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
```
