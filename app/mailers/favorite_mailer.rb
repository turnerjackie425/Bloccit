class FavoriteMailer < ApplicationMailer
  default from: "turnerjackie425@gmail.com"

  def new_comment(user, post, comment)

    #New Headers
    headers["Message-ID"] = "<comments/#{comment.id}@bloccit-cp27.example"
    headers["In-Reply-To"] = "<post/#{post.id}@bloccit-cp27.example"
    headers["References"] = "<post/#{post.id}@bloccit-cp27.example"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
