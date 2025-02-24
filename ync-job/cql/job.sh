echo "Env: $CONTACT_POINT $USERNAME $PASSWORD"
echo "Called: $0 $1"
cqlsh "$CONTACT_POINT" --username "$USERNAME" --password "$PASSWORD" -f "$1"