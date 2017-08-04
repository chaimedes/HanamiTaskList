class UserRepository < Hanami::Repository
  def find_by_identifier(identifier)
    users
      .where(identifier: identifier)
      .to_a
  end

  def find_by_id_and_identifier(id, identifier)
    users
      .where(identifier: identifier, id: id)
      .to_a
  end
end
