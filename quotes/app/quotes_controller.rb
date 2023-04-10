class QuotesController < R001z::Controller
    def a_quote
        "What kinda rappin is this?"
    end

    def shakes
        @noun = :winking
        render(:shakes)
    end

    def card_trick
        @card = params["card"] || "Queen"
        "Your card is the #{@card} of Spades!"
    end
end