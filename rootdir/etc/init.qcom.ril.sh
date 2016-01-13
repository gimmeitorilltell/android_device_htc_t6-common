#!/system/bin/sh
export PATH=/system/xbin:$PATH

multisim=`getprop persist.radio.multisim.config`
product=`getprop ro.product.product`

if [ "$multisim" = "dsds" ] || [ "$multisim" = "dsda" ]; then
    start ril-daemon2
fi

if [ "$product" = "t6wl" ] || [ "$product" = "t6whl" ]; then
    start cdma_kickstarter
else
    start gms_kickstarter
fi
