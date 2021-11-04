# Gapps
ifeq ($(WITH_GAPPS),true)
$(call inherit-product, vendor/gms/products/gms.mk)

# Common Overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/octavi/overlay-gapps/common

# Exclude RRO Enforcement
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS +=  \
    vendor/octavi/overlay-gapps

$(call inherit-product, vendor/octavi/config/rro_overlays.mk)
endif
