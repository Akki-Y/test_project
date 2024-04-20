class PostMailer < ApplicationMailer
def new_post_live(post)
    @post = post
    mail(to: 'mallela.sundeep@gmail.com', subject: 'Yahoo! Your new post is live.')
    end
end
