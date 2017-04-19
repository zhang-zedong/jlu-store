module FlashesHelper
  def user_facing_flashes
    flash.to_hash.slice "notice", "alert", "warning", "info"
  end

  FLASH_CLASSES = {notice: "success", alert: "danger", warning: "warning", info: "info"}.freeze
  def flash_class(key)
    FLASH_CLASSES.fetch(key.to_sym, key)
  end
end
