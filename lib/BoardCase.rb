class BoardCase
    attr_reader :id
    attr_accessor :content, :played_state
  
    def initialize(id)
        @id = id
        @content = "."
        @played_state = false
    end

    def get_content()
        return @content
    end

    def set_content(new_content)
        unless get_played_state
            set_played_state(true)
            return @content = new_content
        end
        return @content
    end

    private

    def get_played_state()
        return @played_state
    end

    def set_played_state(new_state)
        return @played_state = new_state
    end
  
  end