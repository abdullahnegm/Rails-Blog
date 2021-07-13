class PaymentsController < ApplicationController


    def create
        post = Post.first
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                name: post.title,
                amount: 9999,
                currency: 'usd',
                quantity: 1
            }],
            mode: 'payment',
            success_url: "http://www.facebook.com",
            cancel_url: "http://www.facebook.com",
        })

        respond_to do |format|
            format.js 
        end
    end


end