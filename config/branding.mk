OCTAVI_STATUS = 1.1

ifndef OCTAVI_BUILD_TYPE
    OCTAVI_BUILD_TYPE := Unofficial
endif

ifneq ($(SIGNING_KEYS),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(SIGNING_KEYS)/releasekey
endif

CURRENT_DEVICE := $(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
LIST := $(shell cat vendor/octavi/octavi.devices)

ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
    ifeq ($(filter-out Officla OFFICIAL, $(OCTAVI_BUILD_TYPE)),)
        ifeq ($(OCTAVI_BUILD_TYPE), Official)
          BUILD_TYPE := Official
        endif
        ifeq ($(OCTAVI_BUILD_TYPE), OFFICIAL)
          BUILD_TYPE := OFFICIAL
        endif
    endif
else
    ifeq ($(filter-out Official OFFICIAL, $(OCTAVI_BUILD_TYPE)),)
      $(error "Invalid OCTAVI_BUILD_TYPE!")
    endif
endif

TARGET_PRODUCT_SHORT := $(subst octavi_,,$(TARGET_PRODUCT))

OCTAVI_VERSION := OctaviOS-v$(OCTAVI_STATUS)-$(TARGET_PRODUCT_SHORT)-$(shell date -u +%Y%m%d)-$(OCTAVI_BUILD_TYPE)

OCTAVI_BRANDING_VERSION := $(OCTAVI_BUILD_TYPE)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.build.project=octavi \
  ro.octavi.version=$(OCTAVI_VERSION) \
  ro.octavi.status=$(OCTAVI_STATUS) \
  ro.octavi.branding.version=$(OCTAVI_BRANDING_VERSION)
