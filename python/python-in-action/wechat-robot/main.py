from config import TOKEN, XML_STR
from flask import Flask, request, make_response
import hashlib
import xml.etree.ElementTree as ET
from joke import get_joke


app = Flask(__name__)

@app.route('/message', methods=['GET','POST'])
def chatme():
    if request.method == 'GET':
        data = request.args
        token = TOKEN
        signature = data.get('signature', '')
        timestamp = data.get('timestamp', '')
        nonce = data.get('nonce','')
        echostr = data.get('echostr','')
        s = [timestamp,nonce,token]
        s = ''.join(s).encode("utf-8")
    
    if hashlib.sha1(s).hexdigest() == signature:
        return make_response(echostr)
    else:
        return make_response("signature validation error")

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80, debug=True)