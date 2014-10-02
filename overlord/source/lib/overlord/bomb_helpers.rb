module Overlord
  module BombHelpers
    def bomb_status
      session[:bomb].nil? ? :unbooted : session[:bomb].status
    end

    def configure_bomb(codes = nil)
      codes = codes.try(:split, ' ') || []
      return new_bomb(codes.first) if session[:bomb].nil?
      return arm_bomb(*codes) if session[:bomb].inactive?
      return disarm_bomb(codes.first) if session[:bomb].active?
      reboot_bomb(codes.first)
    rescue => e
      notify(e.message)
    end

    def new_bomb(code)
      session[:bomb] = Bomb.new(code)
    end

    def arm_bomb(on_code, off_code = nil)
      on_code, off_code = nullify?(on_code), nullify?(off_code)
      session[:bomb].activate!(on_code, off_code)
    end

    def disarm_bomb(code)
      session[:bomb].deactivate!(code)
    end

    def reboot_bomb(code)
      session[:bomb].reboot!(code)
    end

    def nullify?(value)
      value.empty? ? nil : value
    end
  end
end
