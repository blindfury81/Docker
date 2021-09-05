FROM alpine:3.12

#################################################################
##  Enter your PIA credentials and desired PIA loction below.  ##
ARG username=your_pia_username
ARG password=your_pia_password
ENV piaConfig="ca_toronto.ovpn"

RUN  \
      apk add --no-cache  wget  \
  &&  apk add --no-cache  zip  \
  &&  apk add --no-cache  openvpn  \
  &&  mkdir -p /etc/pia  \
  &&  echo $username > /etc/pia/auth.txt  \
  &&  echo $password >> /etc/pia/auth.txt  \
  &&  wget https://www.privateinternetaccess.com/openvpn/openvpn.zip  \
  &&  unzip  openvpn.zip -d /etc/pia  \
  &&  rm -f  openvpn.zip  \
  &&  sed -i 's/auth-user-pass/auth-user-pass \/etc\/pia\/auth.txt/g' /etc/pia/*.ovpn  \
  &&  apk del  wget  \
  &&  apk del  zip

CMD openvpn /etc/pia/${piaConfig}
