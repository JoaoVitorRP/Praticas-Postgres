SELECT t.id, t.message, u.name AS writer, us.name AS recipient FROM testimonials t JOIN users u ON t."writerId" = u.id JOIN users us ON t."recipientId" = us.id;
