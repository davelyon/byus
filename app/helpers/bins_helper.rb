module BinsHelper
  def bookmarklet_for_bin(bin)
"function bsv(){var d=document,z=d.createElement('scr'+'ipt'),b=d.body,l=d.location;try{if(!b)throw(0);d.title='(Saving...)'+d.title;z.setAttribute('src',l.protocol+'#{bookmarklet_url(bin).sub('http:','')}?link[location]='+encodeURIComponent(l.href));b.appendChild(z);}catch(e){alert('Wait for page to load!');}}bsv();void(0)"
  end
end
