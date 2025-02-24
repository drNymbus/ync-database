echo "Env: $CONTACT_POINT $USERNAME $PASSWORD"
echo "Called: $0 $1"
mongosh "$CONTACT_POINT" --username "$USERNAME" --password "$PASSWORD" < "$1"
