```
;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

[module/BTC-price]
type = custom/script
interval = 30

format = <label>
format-foreground = ${color.blanco}

format-prefix = " "
format-prefix-foreground = ${color.amarillo}

exec = ~/.config/polybar/scripts/BTC-price/BTC-price.sh

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
```