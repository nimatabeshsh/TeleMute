package.path = package.path .. ';.luarocks/share/lua/5.2/?.lua'
.. ';.luarocks/share/lua/5.2/?/init.lua'
package.cpath = package.cpath .. ';.luarocks/lib/lua/5.2/?.so'
redis = (loadfile "./libs/redis.lua")()
serpent = require('serpent')
tdcli = dofile('tdcli.lua')
serp = require 'serpent'.block
redis2 = require 'redis'
json = require('dkjson')
clr = require 'term.colors'
HTTP = require('socket.http')
HTTPS = require('ssl.https')
URL = require('socket.url')
clr = require 'term.colors'
db = redis2.connect('127.0.0.1', 6379)
sudo_users = {
  2387735382
}

---[[ list of Redises : ]]
 --1  - 'groups:megacreed'
 --2  - 'botadmins:megacreed'
 --3  - 'muteusers:megacreed'
 --4  - 'owners:megacreed'
 --5  - 'promotes:megacreed'
 --6  - 'lang:megacreed'
 --7  - 'mute_game:megacreed'
 --8  - 'is:added:megacreed'
 --9  - 'mute_contact:megacreed'
 --10 - 'mute_gif:megacreed'
 --11 - 'mute_photo:megacreed'
 --12 - 'mute_audio:megacreed'
 --13 - 'mute_voice:megacreed'
 --14 - 'mute_video:megacreed'
 --15 - 'mute_document:megacreed'
 --16 - 'mute_all:megacreed'
 --17 - 'mute_text:megacreed'
 --18 - 'lock_tag:megacreed'
 --19 - 'lock_username:megacreed'
 --20 - 'lock_persian:megacreed'
 --21 - 'lock_english:megacreed'
 --22 - 'lock_fosh:megacreed'
 --23 - 'lock_emoji:megacreed'
 --24 - 'lock_bots:megacreed'
 --25 - 'lock_links:megacreed'
 --26 - 'bot:usermsgs:megacreed'
 --27 - 'bot:allgpmsgs:megacreed'
 --28 - 'bot:allmsgs:megacreed'
 --29 - 'bot:banned:megacreed'
 --30 - 'setwarn:megacreed'
 --31 - 'warns:megacreed'
 --32 - 'setlock:megacreed'
 --33 - 'warnmax:megacreed'
 --34 - 'markread:megacreed'
 --35 - 'autoleave:megacreed'
 --36 - 'floodtime:megacreed'
 --37 - 'bot:enable:megacreed'
 --38 - 'floodnum:megacreed'
 --39 - 'maxspam:megacreed'
 --40 - 'bot:charge:megacreed'
 --41 - 'lock_mention:megacreed'
 --42 - 'lock_forward:megacreed'
 --43 - 'lock_location:megacreed'
 --44 - 'lock_edit:megacreed'
 --45 - 'lock_caption:megacreed'
 --46 - 'lock_inline:megacreed'
 --47 - 'lock_reply:megacreed'
 --48 - 'sign:mod:megacreed'
 --49 - 'lock_spam:megacreed'
 --50 - 'lock_flood:megacreed'
 --51 - 'lock_shortmsg:megacreed'
 --52 - 'mute_sticker:megacreed'
 --53 - 'mute_weblink:megacreed'
 --54 - 'mute_weblink:megacreed'
 --55 - 'mute_keyboard:megacreed'
 --56 - 'bot:groupss:megacreeps'
 --57 - 'gp:users:megacreed'
 --58 - 'bot:userss:megacreed'
 --59 - 'bot:gbanned:megacreed'
 --60 - 'gp:cmd:megacreed'
 --61 - 'bot:disable:megacreed'
 --62 - 'bot:rules:megacreed'
 --63 - 'mute_user:megacreed'
 --64 - 'filters:youseftearbot'
 --65 - 'shortmsgmax:megacreed'
 --66 - 'editmsg:megacreed'
 --67 - 'allows:megacreed'
 --68 - 'owner_gps:megacreed'
 --69 - 'kicks:user:megacreed'
 --70 - 'bans:user:megacreed'
 --71 - 'limit:media'
 --72 - 'bot:allgpmsgs:'
 --73 - 'bot:allmsgs:'
 --74 - 'markread'
 --75 - 'commands'
 --76 - 'mute_weblink'
 --77 - 'welcome:gp'
 --78 - 'welcome:msg'
 --79 - 'bot:editid'
local function del_msgs(chat_id, message_ids, dl_cb, cmd)
  tdcli_function ({
    ID = "DeleteMessages",
    chat_id_ = chat_id,
    message_ids_ = message_ids -- vector
  }, dl_cb, cmd)
end
local function getParseMode(parse_mode)
  if parse_mode then
    local mode = parse_mode:lower()
    if mode == "markdown" or mode == "md" then
      P = {
        ID = "TextParseModeMarkdown"
      }
    elseif mode == "html" then
      P = {
        ID = "TextParseModeHTML"
      }
    end
  end
  return P
end

local function send_hyper_msg(chat_id , reply_to_message_id , text , user_id)
tdcli_function ({
	ID="sendText", 
	chat_id_= chat_id, 
	reply_to_message_id_= reply_to_message_id , 
	disable_notification_=0, 
	from_background_=1, 
	reply_markup_=nil, 
	input_message_content_= {
		ID="InputMessageText", 
		text_=text, 
		disable_web_page_preview_=1, 
		clear_draft_=0, 
		entities_={[0] = { 
			ID="MessageEntityMentionName", 
			offset_=0, 
			length_=13, 
			user_id_= user_id}}
		}
	}, dl_cb, nil)
	end

local function sendmsg(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, text, disable_web_page_preview, parse_mode)
  local TextParseMode = getParseMode(parse_mode)
  if redis:get('sign:mod:megacreed') then
  if parse_mode == 'md' then
  if redis:hget(chat_id, 'lang:megacreed') == "en" then
      tdcli_function({
    ID = "sendText",
    chat_id_ = chat_id,
    reply_to_message_id_ = reply_to_message_id,
    disable_notification_ = disable_notification,
    from_background_ = from_background,
    reply_markup_ = reply_markup,
    input_message_content_ = {
      ID = "InputMessageText",
	  text_ = text.."\n\nOur Channel : @Ir\\_TeaM",
      disable_web_page_preview_ = disable_web_page_preview,
      clear_draft_ = 0,
      entities_ = {},
      parse_mode_ = TextParseMode
    }
  }, dl_cb, nil)
	  else
tdcli_function({
    ID = "sendText",
    chat_id_ = chat_id,
    reply_to_message_id_ = reply_to_message_id,
    disable_notification_ = disable_notification,
    from_background_ = from_background,
    reply_markup_ = reply_markup,
    input_message_content_ = {
      ID = "InputMessageText",
	  text_ = text.."\n\nکانال ما : @Ir\\_TeaM",
      disable_web_page_preview_ = disable_web_page_preview,
      clear_draft_ = 0,
      entities_ = {},
      parse_mode_ = TextParseMode
    }
  }, dl_cb, nil)	  
	  end
	  else
	  if redis:hget(chat_id, 'lang:megacreed') == "en" then
      tdcli_function({
    ID = "sendText",
    chat_id_ = chat_id,
    reply_to_message_id_ = reply_to_message_id,
    disable_notification_ = disable_notification,
    from_background_ = from_background,
    reply_markup_ = reply_markup,
    input_message_content_ = {
      ID = "InputMessageText",
	  text_ = text.."\n\nOur Channel : @Ir_TeaM",
      disable_web_page_preview_ = disable_web_page_preview,
      clear_draft_ = 0,
      entities_ = {},
      parse_mode_ = TextParseMode
    }
  }, dl_cb, nil)
	  else
tdcli_function({
    ID = "sendText",
    chat_id_ = chat_id,
    reply_to_message_id_ = reply_to_message_id,
    disable_notification_ = disable_notification,
    from_background_ = from_background,
    reply_markup_ = reply_markup,
    input_message_content_ = {
      ID = "InputMessageText",
	  text_ = text.."\n\nکانال ما : @Ir_TeaM",
      disable_web_page_preview_ = disable_web_page_preview,
      clear_draft_ = 0,
      entities_ = {},
      parse_mode_ = TextParseMode
    }
  }, dl_cb, nil)	  
	  end
	  end
  else
  tdcli_function({
    ID = "sendText",
    chat_id_ = chat_id,
    reply_to_message_id_ = reply_to_message_id,
    disable_notification_ = disable_notification,
    from_background_ = from_background,
    reply_markup_ = reply_markup,
    input_message_content_ = {
      ID = "InputMessageText",
      text_ = text,
      disable_web_page_preview_ = disable_web_page_preview,
      clear_draft_ = 0,
      entities_ = {},
      parse_mode_ = TextParseMode
    }
  }, dl_cb, nil)
  end
end
function getUser(user_id, cb)
  tdcli_function ({
    ID = "GetUser",
    user_id_ = user_id
  }, cb, nil)
end
function from_username(user_id)
   function gfrom_user(extra,result,success)
   if result.username_ then
   F = result.username_
   else
   F = 'nil'
   end
    return F
   end
  local username = getUser(user_id,gfrom_user)
  return username
end
local function info_user(username)
  tdcli_function ({
    ID = "SearchPublicChat",
    username_ = username
  }, info_username, extra)
end
local function info_username(extra, result, success)
  vardump(result)
  chat_id = redis:get('chatid')
  local function dl_photo(arg,data)
    tdcli.sendPhoto(chat_id, 0, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,result.id_..'\n'..result.type_.user_.first_name_)
  end
  tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = result.id_,offset_ = 0,limit_ = 100000}, dl_photo, nil)
  redis:del('chatid')
end



function get_info(user_id)
function get_user(user_id)
  function dl_username(arg, data)
    username = (data.username_ or data.first_name_)
    redis:hset('bot:username',data.id_, username)
  end
  tdcli_function ({
    ID = "GetUser",
    user_id_ = user_id
  }, dl_username, nil)
end
  
  get_user(user_id)
  if redis:hget('bot:username',user_id) then
  redis:hget('bot:username',user_id)
    text = '@'..redis:hget('bot:username',user_id)..' [<code>'..user_id..'</code>]'
  end
  return text

end

local function getMessage(chat_id, message_id,cb)
  tdcli_function ({
    ID = "GetMessage",
    chat_id_ = chat_id,
    message_id_ = message_id
  }, cb, nil)
end
-----------------------------------------------------------------------------------------------
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
  tdcli_function ({
    ID = "sendText",
    chat_id_ = chat_id,
    reply_to_message_id_ = reply_to_message_id,
    disable_notification_ = disable_notification,
    from_background_ = from_background,
    reply_markup_ = reply_markup,
    input_message_content_ = {
      ID = "InputMessagePhoto",
      photo_ = getInputFile(photo),
      added_sticker_file_ids_ = {},
      width_ = 0,
      height_ = 0,
      caption_ = caption
    },
  }, dl_cb, nil)
end

function addlist(msg)
  if msg.content_.contact_.ID == "Contact" then
    tdcli.importContacts(msg.content_.contact_.phone_number_, (msg.content_.contact_.first_name_ or '--'), '#bot', msg.content_.contact_.user_id_)
    tdcli.sendText(msg.chat_id_, msg.id_, 0, 1, nil, '<b>You have been Added !</b>\n', 1, 'html')
  end
end

function is_gbanned(msg)
  local msg = data.message_
  local chat_id = msg.chat_id_
  local user_id = msg.sender_user_id_
  local var = false
  local hash = 'bot:gbanned:megacreed'
  local banned = redis:sismember(hash, user_id)
  if banned then
    var = true
  end
  return var
end
function resolve_username(username,cb)
  tdcli_function ({
    ID = "SearchPublicChat",
    username_ = username
  }, cb, nil)
end
function changeChatMemberStatus(chat_id, user_id, status)
  tdcli_function ({
    ID = "ChangeChatMemberStatus",
    chat_id_ = chat_id,
    user_id_ = user_id,
    status_ = {
      ID = "ChatMemberStatus" .. status
    },
  }, dl_cb, nil)
end
function chat_kick(chat_id, user_id)
  changeChatMemberStatus(chat_id, user_id, "Kicked")
end

function is_added(msg)
  local var = false
  if redis:sismember('groups:megacreed',msg.chat_id_) then
    var = true
  end
  return var
end

function is_sudo(msg)
  local var = false
  for v,user in pairs(sudo_users) do
    if user == msg.sender_user_id_ then
      var = true
    end
  end
  return var
end


function is_admin(msg)
  local user_id = msg.sender_user_id_
  local var = false
  local hashs =  'botadmins:megacreed'
  local admin = redis:sismember(hashs, user_id)
  if admin then
    var = true
  end
  for k,v in pairs(sudo_users) do
    if user_id == v then
      var = true
    end
  end
  return var
end
function delete_msg(chatid,mid)
  tdcli_function ({
  ID="DeleteMessages", 
  chat_id_=chatid, 
  message_ids_=mid
  },dl_cb, nil)
end
function serialize_to_file(data, file, uglify)
  file = io.open(file, 'w+')
  local serialized
  if not uglify then
    serialized = serpent.block(data, {
      comment = false,
      name = '_'
    })
  else
    serialized = serpent.dump(data)
  end
  file:write(serialized)
  file:close()
end


function is_normal(msg)
  local chat_id = msg.chat_id_
  local user_id = msg.sender_user_id_
  local mutel = redis:sismember('muteusers:megacreed'..chat_id,user_id)
  if mutel then
    return true
  end
  if not mutel then
    return false
  end
end


-- function owner
function is_owner(msg)
  local var = false
  local chat_id = msg.chat_id_
  local user_id = msg.sender_user_id_
  local group_owners = redis:get('owners:megacreed'..chat_id)
  if group_owners == tostring(user_id) then
    var = true
  end
  if redis:sismember('botadmins:megacreed',user_id) then
    var = true
  end
  for v, user in pairs(sudo_users) do
    if user == user_id then
      var = true
    end
  end
  return var
end


--- promotes PM is ( Moderators )
function is_mod(msg)
  local var = false
  local chat_id = msg.chat_id_
  local user_id = msg.sender_user_id_
  if redis:sismember('promotes:megacreed'..chat_id,user_id) then
    var = true
  end
  if redis:sismember('botadmins:megacreed',user_id) then
    var = true
  end

  if  redis:get('owners:megacreed'..chat_id) == tostring(user_id) then
    var = true
  end
  for v, user in pairs(sudo_users) do
    if user == user_id then
      var = true
    end
  end
  return var
end
function is_allowed(msg)
  local var = false
  local chat_id = msg.chat_id_
  local user_id = msg.sender_user_id_
  if redis:sismember('promotes:megacreed'..chat_id,user_id) then
    var = true
  end
  if redis:sismember('allows:megacreed'..chat_id,user_id) then
    var = true
  end
  if redis:sismember('botadmins:megacreed',user_id) then
    var = true
  end

  if  redis:get('owners:megacreed'..chat_id) == tostring(user_id) then
    var = true
  end
  for v, user in pairs(sudo_users) do
    if user == user_id then
      var = true
    end
  end
  return var
end
function is_momod(user_id, chat_id)
    local var = false
    local hash =  'promotes:megacreed'..chat_id
    local mod = redis:sismember(hash, user_id)
	local hashs =  'botadmins:megacreed'
    local admin = redis:sismember(hashs, user_id)
	local hashss =  'owners:megacreed'..chat_id
    local owner = redis:sismember(hashss, user_id)
	 if mod then
	    var = true
	 end
	 if owner then
	    var = true
	 end
	 if admin then
	    var = true
	 end
    for k,v in pairs(sudo_users) do
    if user_id == v then
      var = true
    end
	end
    return var
end

-- Print message format. Use serpent for prettier result.
function vardump(value, depth, key)
  local linePrefix = ''
  local spaces = ''

  if key ~= nil then
    linePrefix = key .. ' = '
  end

  if depth == nil then
    depth = 0
  else
    depth = depth + 1
    for i=1, depth do
      spaces = spaces .. '  '
    end
  end

  if type(value) == 'table' then
    mTable = getmetatable(value)
    if mTable == nil then
      print(spaces .. linePrefix .. '(table) ')
    else
      print(spaces .. '(metatable) ')
      value = mTable
    end
    for tableKey, tableValue in pairs(value) do
      vardump(tableValue, depth, tableKey)
    end
  elseif type(value)  == 'function' or
    type(value) == 'thread' or
    type(value) == 'userdata' or
    value == nil then
      print(spaces .. tostring(value))
    elseif type(value)  == 'string' then
      print(spaces .. linePrefix .. '"' .. tostring(value) .. '",')
    else
      print(spaces .. linePrefix .. tostring(value) .. ',')
    end
  end

  -- Print callback
  function dl_cb(arg, data)

  end
 
  local function setowner_reply(extra, result, success)
    t = vardump(result)
    local msg_id = result.id_
    local user = result.sender_user_id_
	RDSC = redis:get('owners:megacreed'..result.chat_id_)
	if RDSC then
    redis:srem('owner_gps:megacreed'..RDSC,result.chat_id_)
    redis:set('owners:megacreed'..result.chat_id_,user)
    redis:sadd('owner_gps:megacreed'..user,result.chat_id_)
	else
    redis:set('owners:megacreed'..result.chat_id_,user)
    redis:sadd('owner_gps:megacreed'..user,result.chat_id_)
	end
    if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
      text = 'User : '..get_info(user)..' <b>Has been Promoted As Owner !</b>'
    else
      text = 'کاربر : \n'..get_info(user)..'\n <b>به عنوان مدير ارتقا يافت !</b>'
    end
    sendmsg(result.chat_id_, 0, 0, 1, nil, text, 1, 'html')
    print(user)
  end



  function kick_reply(extra, result, success)
    if redis:sismember('promotes:megacreed'..result.chat_id_, result.sender_user_id_) or redis:sismember('botadmins:megacreed' , result.sender_user_id_) then
      if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
        text = '*You Can,t Kick Moderators !*'
      else
        text = '*شما نميتوانيد مدير و ناظم هارا حذف کنيد !*'
      end
      sendmsg(result.chat_id_, 0, 0, 1, nil, text, 1, 'md')
    else
      b = vardump(result)
      tdcli.changeChatMemberStatus(result.chat_id_, result.sender_user_id_, 'Kicked')
	  redis:incr('kicks:user:megacreed'..result.sender_user_id_)
      if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
        text = '<b>Successfull !</b>\n User : '..get_info(result.sender_user_id_)..' <b> Has Been Kicked</b>'
      else
        text = '<b>تراکنش موفق !</b>\nکاربر : \n'..get_info(result.sender_user_id_)..'\n<b>از گروه حذف شد !</b>'
      end
      sendmsg(result.chat_id_, 0, 0, 1, nil, text, 1, 'html')
    end
  end


  local function deleteMessagesFromUser(chat_id, user_id, cb, cmd)
    tdcli_function ({
      ID = "DeleteMessagesFromUser",
      chat_id_ = chat_id,
      user_id_ = user_id
    },cb or dl_cb, cmd)
  end


  local function setmod_reply(extra, result, success)

    local msg = result.id_
    local user = result.sender_user_id_
    local chat = result.chat_id_
    redis:sadd('promotes:megacreed'..result.chat_id_, user)
    if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
      text = 'User : '..get_info(user)..' <b>Has been Promoted !</b>'
    else
      text = 'کاربر : \n'..get_info(user)..'\n ارتقا يافت !'
    end
    sendmsg(result.chat_id_, 0, 0, 1, nil, text, 1, 'html')
  end

  local function remmod_reply(extra, result, success)

    local msg = result.id_
    local user = result.sender_user_id_
    local chat = result.chat_id_
    redis:srem('promotes:megacreed'..chat,user)
    if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
      text = 'User : '..get_info(user)..' <b>Has been Demoted !</b>'
    else
      text = 'کاربر : \n'..get_info(user)..'\n عزل مقام شد !'
    end

    sendmsg(result.chat_id_, 0, 0, 1, nil, text, 1, 'html')
  end


  function ban_reply(extra, result, success)
    if redis:sismember('promotes:megacreed'..result.chat_id_, result.sender_user_id_) or redis:sismember("botadmins:", result.sender_user_id_) or (redis:get('owners:megacreed'..result.chat_id_) ==  result.sender_user_id_) then
      if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
        text = '*You Can,t Ban Moderators !*'
      else
        text = '*شما نميتوانيد مدير و ناظم ها را بن کنيد !*'
      end
      sendmsg(result.chat_id_, 0, 0, 1, nil, text, 1, 'md')
    else
      if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
        text = 'User : '..result.sender_user_id_..' <b>Has been Banned !</b>'
      else
        text = 'کاربر : \n'..get_info(result.sender_user_id_)..'\n <b>بن شد !</b>'
      end
      tdcli.changeChatMemberStatus(result.chat_id_, result.sender_user_id_, 'Kicked')
	  redis:incr('bans:user:megacreed'..result.sender_user_id_)
      sendmsg(result.chat_id_, 0, 0, 1, nil, text, 1, 'html')
    end
  end
  local function setmute_reply(extra, result, success)
    vardump(result)
    if not (redis:sismember('promotes:megacreed'..result.chat_id_, result.sender_user_id_) or redis:sismember("botadmins:", result.sender_user_id_) or (redis:get('owners:megacreed'..result.chat_id_) ==  result.sender_user_id_)) then
      redis:sadd('muteusers:megacreed'..result.chat_id_,result.sender_user_id_)
      if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
        text = '<b>Successfull !</b>\nUser : '..get_info(result.sender_user_id_)..' <b>Has been Muted !</b>\nStatus : <code>Cant Speak</code>'
      else
        text = '<b>تراکنش موفق !</b>\nکاربر : \n'..get_info(result.sender_user_id_)..'\n <b>به ليست ساکت ها اضافه شد !</b>\nوضعيت : <code>قادر به حرف زدن نميباشد</code>'
      end
      sendmsg(result.chat_id_, 0, 0, 1, nil, text, 1, 'html')
    else
      if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
        text = '<b>Error !</b>\n<b>You Can,t Mute Moderators !</b>'
      else
        text = '<b>خطا !</b>\n<b>شما نميتوانيد مدير يا ناظم هارا ساکت بکنيد !</b>'
      end
      sendmsg(result.chat_id_, 0, 0, 1, nil, text, 1, 'html')
    end
  end

  local function demute_reply(extra, result, success)
    --vardump(result)
    redis:srem('muteusers:megacreed'..result.chat_id_,result.sender_user_id_)
    if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
      text = '<b>Successfull !</b>\nUser : '..get_info(result.sender_user_id_)..' <b>Has been UnMuted !</b>\nStatus : <code>He Can Speak Now</code>'
    else
      text = '<b>تراکنش موفق !</b>\nکاربر : \n'..get_info(result.sender_user_id_)..'\n <b>از ليست ساکت ها حذف شد !</b>\nوضعيت : <code> اکنون قادر به حرف زدن ميباشد</code>'
    end
    sendmsg(result.chat_id_, 0, 0, 1, nil, text, 1, 'html')
  end

  function user_info(extra,result)
    if result.user_.username_  then
      username = '*Username :* @'..result.user_.username_..''
    else
      username = ''
    end
    local text = '<b>Firstname :</b> <code>'..(result.user_.first_name_ or 'none')..'</code>\n<b>Group ID : </b><code>'..extra.gid..'</code>\n<b>Your ID  :</b> <code>'..result.user_.id_..'</code>\n<b>Your Phone : </b><code>'..(result.user_.phone_number_ or  '<b>--</b>')..'</code>\n'..username
    sendmsg(extra.gid,extra.msgid, 0, 1,  text, 1, 'html')
  end


  function idby_photo(extra,data)
    --vardump(extra)
    --vardump(data)
    if redis:hget(extra.gid, 'lang:megacreed') == "en" then
      text = 'SuperGroup ID : '..string.sub(extra.gid, 5,14)..'\nUser ID : '..extra.uid..'\n'
    else
      text = 'آيدي گروه : '..string.sub(extra.gid, 5,14)..'\nآيدي کاربر : '..extra.uid..'\n'
    end
    tdcli.sendPhoto(extra.gid, 0, extra.id, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_, text)
  end

  function get_msg(msgid,chatid,cb1,cb2)
    return tdcli_function({ID = "GetMessage",chat_id_ = chatid,message_id_ = msgid}, cb1, cb2)
  end

  function get_pro(uid,cb1,cb2)
    tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = uid,offset_ = 0,limit_ = 1}, cb1, cb2)
  end

  function idby_reply(extra,data)
    --vardump(extra)
    --vardump(data)
    local uid = data.sender_user_id_
    get_pro(uid,idby_photo,{gid=extra.gid,uid=uid,id=extra.id})
  end
  function is_banned(msg)
    local var = false
    local msg = data.message_
    local chat_id = msg.chat_id_
    local user_id = msg.sender_user_id_
    local hash = 'bot:banned:megacreed'..chat_id
    local banned = redis:sismember(hash, user_id)
    if banned then
      var = true
    end
    return var
  end
  

		  
  function tdcli_update_callback(data)

    if (data.ID == "UpdateNewMessage") then
      local msg = data.message_
      local input = msg.content_.text_
      local chat_id = msg.chat_id_
      local user_id = msg.sender_user_id_
      local reply_id = msg.reply_to_message_id_



      if msg.chat_id_ then



        local id = tostring(msg.chat_id_)
        if (id:match('^(%d+)') or id:match('^-100(%d+)')) then --- msg to group
        -------------

        if msg.content_.game_ then
          if redis:get('mute_game:megacreed'..chat_id) and msg.content_.game_ and not is_mod(msg) then
            tdcli.deleteMessages(chat_id, {[0] = msg.id_})
          end
        end
        ---------
        if  msg.content_.ID == "MessageContact" and msg.content_.contact_  then
	 if redis:get('mute_contact:megacreed'..chat_id) or redis:get('mute_all:megacreed'..msg.chat_id_) then
            if msg.content_.contact_ and not is_mod(msg) then
              tdcli.deleteMessages(chat_id, {[0] = msg.id_})
            end
          end
        end
      end
    end


 if  msg.content_.animation_ then
        if redis:get('mute_gif:megacreed'..chat_id) and (not is_mod(msg) or not is_allowed(msg)) or redis:get('mute_all:megacreed'..msg.chat_id_) and (not is_mod(msg) or not is_allowed(msg)) or redis:sismember('muteusers:megacreed'..msg.chat_id_, msg.sender_user_id_) then
              tdcli.deleteMessages(chat_id, {[0] = msg.id_})
        end
     end
       
        if msg.content_.photo_ then
          if redis:get('mute_photo:megacreed'..chat_id) and (not is_mod(msg) or not is_allowed(msg)) or redis:get('mute_all:megacreed'..msg.chat_id_) and (not is_mod(msg) or not is_allowed(msg)) or redis:sismember('muteusers:megacreed'..msg.chat_id_, msg.sender_user_id_) then
              tdcli.deleteMessages(chat_id, {[0] = msg.id_})
            end
          end

        if msg.content_.audio_ then
          if redis:get('mute_audio:megacreed'..chat_id) and (not is_mod(msg) or not is_allowed(msg)) or redis:get('mute_all:megacreed'..msg.chat_id_) and (not is_mod(msg) or not is_allowed(msg)) or redis:sismember('muteusers:megacreed'..msg.chat_id_, msg.sender_user_id_) then
              tdcli.deleteMessages(chat_id, {[0] = msg.id_})
            end
          end
        
        if msg.content_.voice_ then
          if redis:get('mute_voice:megacreed'..chat_id) and (not is_mod(msg) or not is_allowed(msg)) or redis:get('mute_all:megacreed'..msg.chat_id_)  and (not is_mod(msg) or not is_allowed(msg)) or redis:sismember('muteusers:megacreed'..msg.chat_id_, msg.sender_user_id_) then
              tdcli.deleteMessages(chat_id, {[0] = msg.id_})
            end
          end
        if  msg.content_.video_ then
          if redis:get('mute_video:megacreed'..chat_id) and (not is_mod(msg) or not is_allowed(msg)) or redis:get('mute_all:megacreed'..msg.chat_id_) and (not is_mod(msg) or not is_allowed(msg)) or redis:sismember('muteusers:megacreed'..msg.chat_id_, msg.sender_user_id_) then
              tdcli.deleteMessages(chat_id, {[0] = msg.id_})
            end
          end
        if  msg.content_.document_ then
          if redis:get('mute_document:megacreed'..chat_id) and (not is_mod(msg) or not is_allowed(msg)) or redis:get('mute_all:megacreed'..msg.chat_id_) and (not is_mod(msg) or not is_allowed(msg))  or redis:sismember('muteusers:megacreed'..msg.chat_id_, msg.sender_user_id_) then
              tdcli.deleteMessages(chat_id, {[0] = msg.id_})
          end
        end
        

        if msg.content_.location_ and redis:hget(chat_id , 'lock_location:megacreed') and (not is_mod(msg) or not is_allowed(msg)) then
		-- setlimit
			limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'location') or tostring(0)
			print(limits)
			if limits > tostring(0) then
			redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'links', limits - tostring(1))
			else
          if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..msg.sender_user_id_.." <b> Has been Kicked !</b>\nReason : <code>Location Sent !</code>"
							else
						text = "کاربر : "..msg.sender_user_id_.." <b> اخراج شد</b>\n علت : <code>ارسال مکان !</code>"
							end
				sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Location Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : "..get_info(msg.sender_user_id_).." <b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال مکان !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) > redis:get('warnmax:megacreed'..msg.chat_id_) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..msg.sender_user_id_.." <b> Has been Kicked !</b>\nReason : <code>Location Sent !</code>"
							else
						text = "کاربر : "..msg.sender_user_id_.." <b> اخراج شد</b>\n علت : <code>ارسال مکان !</code>"
							end
						sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
						redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..msg.sender_user_id_.." <b> Has been Banned</b>\nReason : <code>Location Sent !</code>"
					else
						text = "کاربر : "..msg.sender_user_id_.." <b> مسدود شد</b>\n علت : <code>ارسال مکان !</code>"
					end
				sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				end
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..msg.sender_user_id_.." <b> Has been Banned</b>\nReason : <code>Location Sent !</code>"
					else
						text = "کاربر : "..msg.sender_user_id_.." <b> مسدود شد</b>\n علت : <code>ارسال مکان !</code>"
					end
				sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				end
				end


		
		
		
		if msg.forward_info_ then
			if redis:get('lock_forward:megacreed'..msg.chat_id_) and (not is_mod(msg) or not is_allowed(msg)) or redis:get('mute_all:megacreed'..msg.chat_id_) and (not is_mod(msg) or not is_allowed(msg)) then
					tdcli.deleteMessages(chat_id, {[0] = msg.id_})
			end
		end
 
		

					
					
	if msg.content_.contact_ then
		if redis:get('mute_contact:megacreed'..msg.chat_id_) and (not is_mod(msg) or not is_allowed(msg)) or redis:get('mute_all:megacreed'..msg.chat_id_) and (not is_mod(msg) or not is_allowed(msg)) then
			tdcli.deleteMessages(chat_id, {[0] = msg.id_})
		end
	end


	   if msg.content_.sticker_ then
	      if redis:get('mute_sticker:megacreed'..chat_id) and (not is_mod(msg) or not is_allowed(msg)) or redis:get('mute_all:megacreed'..msg.chat_id_) and (not is_mod(msg) or not is_allowed(msg)) then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
          end

		  
		  if msg.content_.caption_ then
        if redis:hget(chat_id , 'lock_caption:megacreed') and (not is_mod(msg) or not is_allowed(msg)) then
		-- setlimit
			limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'caption') or tostring(0)
			print(limits)
			if limits > tostring(0) then
			redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'links', limits - tostring(1))
			else
				if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Media Caption Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال متن زیر رسانه !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Media Caption Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال متن زیر رسانه !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Media Caption Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال متن زیر رسانه !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Media Caption Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال متن زیر رسانه !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Media Caption Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال متن زیر رسانه !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				end
				end
				
				

            if redis:hget(chat_id , 'lock_links:megacreed') and msg.content_.caption_:match("telegram.me") and (not is_mod(msg) or not is_allowed(msg)) or msg.content_.caption_:match("t.me") and (not is_mod(msg) or not is_allowed(msg)) then
			-- setlimit
			limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'links') or tostring(0)
			print(limits)
			if limits > tostring(0) then
			redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'links', limits - tostring(1))
			else
if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Links Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال لینک !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Links Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال لینک !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Links Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال لینک !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Links Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال لینک !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Links Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال لینک !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
            end
			end
					
            if redis:hget(chat_id , 'lock_tag:megacreed') and msg.content_.caption_:find("#") and (not is_mod(msg) or not is_allowed(msg)) then
			
if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Tag[#] Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال تگ[#] !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Tag[#] Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال تگ[#] !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Tag[#] Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال تگ[#] !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Tag[#] Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال تگ[#] !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Tag[#] Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال تگ[#] !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
            end


            if redis:hget(chat_id , 'lock_username:megacreed') and msg.content_.caption_:find("@") and (not is_mod(msg) or not is_allowed(msg)) then
if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Username[@] Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال یوزرنیم[@] !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Username[@] Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال یوزرنیم[@] !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Username[@] Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال یوزرنیم[#] !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Username[@] Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال یوزرنیم[@] !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Username[#] Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال یوزرنیم[@] !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
            end

            if redis:hget(chat_id , 'lock_persian:megacreed') and msg.content_.caption_:find("[\216-\219][\128-\191]") and (not is_mod(msg) or not is_allowed(msg)) then

if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Persian Words Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال حروف فارسی !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Persian Words Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال حروف فارسی !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Persian Words Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال حروف فارسی !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Persian Words !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال حروف فارسی !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Persian Words Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال حروف فارسی !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
            end

            local is_english_msg = msg.content_.caption_:find("[a-z]") or msg.content_.caption_:find("[A-Z]")
            if redis:hget(chat_id , 'lock_english:megacreed') and is_english_msg and (not is_mod(msg) or not is_allowed(msg)) then
if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>English Words Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال حروف انگلیسی !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>English Words Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال حروف انگلیسی !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>English Words Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>اارسال حروف انگلیسی !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>English Words Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال حروف انگلیسی !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>English Words Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال حروف انگلیسی !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
            end

            local is_fosh_msg = msg.content_.caption_:find("کير") or msg.content_.caption_:find("کص") or msg.content_.caption_:find("کون") or msg.content_.caption_:find("85") or msg.content_.caption_:find("جنده") or msg.content_.caption_:find("ننه") or msg.content_.caption_:find("ننت") or msg.content_.caption_:find("مادر") or msg.content_.caption_:find("قهبه") or msg.content_.caption_:find("گايي") or msg.content_.caption_:find("سکس") or msg.content_.caption_:find("kir") or msg.content_.caption_:find("kos") or msg.content_.caption_:find("kon") or msg.content_.caption_:find("nne") or msg.content_.caption_:find("nnt")
            if redis:hget(chat_id , 'lock_fosh:megacreed') and is_fosh_msg and (not is_mod(msg) or not is_allowed(msg)) then

if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Badwords Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال فحش !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Badwords Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال فحش !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Badwords Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال فحش !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Badwords Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال فحش !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Badwords Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال فحش !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
            end

            local is_emoji_msg = msg.content_.caption_:find("😀") or msg.content_.caption_:find("😬") or msg.content_.caption_:find("😁") or msg.content_.caption_:find("😂") or  msg.content_.caption_:find("😃") or msg.content_.caption_:find("😄") or msg.content_.caption_:find("😅") or msg.content_.caption_:find("☺️") or msg.content_.caption_:find("🙃") or msg.content_.caption_:find("🙂") or msg.content_.caption_:find("😊") or msg.content_.caption_:find("😉") or msg.content_.caption_:find("😇") or msg.content_.caption_:find("😆") or msg.content_.caption_:find("😋") or msg.content_.caption_:find("😌") or msg.content_.caption_:find("😍") or msg.content_.caption_:find("😘") or msg.content_.caption_:find("😗") or msg.content_.caption_:find("😙") or msg.content_.caption_:find("😚") or msg.content_.caption_:find("🤗") or msg.content_.caption_:find("😎") or msg.content_.caption_:find("🤓") or msg.content_.caption_:find("🤑") or msg.content_.caption_:find("😛") or msg.content_.caption_:find("😏") or msg.content_.caption_:find("😶") or msg.content_.caption_:find("😐") or msg.content_.caption_:find("😑") or msg.content_.caption_:find("😒") or msg.content_.caption_:find("🙄") or msg.content_.caption_:find("🤔") or msg.content_.caption_:find("😕") or msg.content_.caption_:find("😔") or msg.content_.caption_:find("😡") or msg.content_.caption_:find("😠") or msg.content_.caption_:find("😟") or msg.content_.caption_:find("😞") or msg.content_.caption_:find("😳") or msg.content_.caption_:find("🙁") or msg.content_.caption_:find("☹️") or msg.content_.caption_:find("😣") or msg.content_.caption_:find("😖") or msg.content_.caption_:find("😫") or msg.content_.caption_:find("😩") or msg.content_.caption_:find("😤") or msg.content_.caption_:find("😲") or msg.content_.caption_:find("😵") or msg.content_.caption_:find("😭") or msg.content_.caption_:find("😓") or msg.content_.caption_:find("😪") or msg.content_.caption_:find("😥") or msg.content_.caption_:find("😢") or msg.content_.caption_:find("🤐") or msg.content_.caption_:find("😷") or msg.content_.caption_:find("🤒") or msg.content_.caption_:find("🤕") or msg.content_.caption_:find("😴") or msg.content_.caption_:find("💋") or msg.content_.caption_:find("❤️")
            if redis:hget(chat_id , 'lock_emoji:megacreed') and is_emoji_msg and (not is_mod(msg) or not is_allowed(msg)) then

if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Emoji Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال شکلک!</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Emoji Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال شکلک!</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Emoji Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال شکلک!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Emoji Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال شکلک!</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Emoji Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال شکلک!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
			 end
		  end
		  
    if msg.content_.ID == "MessageText"  then
	
	
	  -------------------------------------------------
if msg.content_.text_ then

 --------------------------------------------------
 if msg.content_.text_:match("^[Ss]ign on$") and is_sudo(msg) then
 if redis:get('sign:mod:megacreed') then
 if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
 text = '<b>Sign Messages is Already Enabled ! </b>'
 else
 text = '<b>زدن امضا زیر پیام ها از قبل فعال بود ! ! </b>'
 end
 else
 if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
   text = '<b>Sign Messages Has been Enabled ! </b>'
 else
   text = '<b>زدن امضا زیر پیام ها فعال شد ! </b>'
 end
 end
  sendmsg(msg.chat_id_, msg.id_, 0,1,nil, text, 1, "html")
 redis:set('sign:mod:megacreed', true)
 end
 if msg.content_.text_:match("^[Ss]ign off$") and is_sudo(msg) then
 if not redis:get('sign:mod:megacreed') then
  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
   text = '*Sign Messages is Already Disabled ! *'
  else
   text = '*زدن امضا زیر پیام ها از قبل غیر فعال شده بود ! *'
  end
 else 
  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
   text = '*Sign Messages is Already Disabled ! *'
  else
   text = '*زدن امضا زیر پیام ها غیر فعال شد ! *'
  end
 end
 redis:del('sign:mod:megacreed')
 sendmsg(msg.chat_id_, msg.id_, 0,1,nil, text, 1, "md")
 end
 if msg.content_.text_:match("^leave$") and is_admin(msg) then 
		if redis:hget(msg.chat_id_, 'lang:megacreed') =="en" then
			text = "*Good Bye !*\nRobot Leaves here By `Admins Commands !`"
			else
			text = "⚠️به دستور ادمین ربات از گروه خارج می‌شود🙄"
		end
				sendmsg(msg.chat_id_, msg.id_, 0,1,nil, text, 1, "md")
				tdcli.changeChatMemberStatus(chat_id, tonumber(239726711), 'Left')
		end

        function check_username(extra,result,success)
          --vardump(result)
          local username = (result.username_ or '')
          local svuser = 'user:'..result.id_
		  if username and username:find("[Bb][Oo][Tt]") then
      if redis:get('lock_bots:megacreed'..msg.chat_id_) then
		 chat_kick(msg.chat_id_, result.id_)
		 return false
		 end
	  end
        end
    tdcli.getUser(msg.sender_user_id_,check_username)
	
          if redis:get('mute_text:megacreed'..chat_id) or redis:get('mute_all:megacreed'..msg.chat_id_) then
            if msg.content_.text_ and not is_mod(msg) then
              tdcli.deleteMessages(chat_id, {[0] = msg.id_})
            end
          end
        end
      redis:incr('bot:usermsgs:megacreed'..msg.chat_id_..":"..msg.sender_user_id_)
      redis:incr('bot:allgpmsgs:megacreed'..msg.chat_id_)
      redis:incr('bot:allmsgs:megacreed')
      if msg.chat_id_ then
        local id = tostring(msg.chat_id_)
        if id:match('-100(%d+)') then
		
				  if not redis:get('warnmax:megacreed'..msg.chat_id_) then
		  redis:set('warnmax:megacreed'..msg.chat_id_, 3)
		  end
		  if not redis:get('setwarn:megacreed'..msg.chat_id_) then
		  redis:set('setwarn:megacreed'..msg.chat_id_, "ban")
		  end
		
	if redis:get('markread:megacreed'..msg.chat_id_) then
	              tdcli.viewMessages(chat_id, {[0] = msg.id_})
	end
          if msg.content_.text_:match("^/leave(%d+)$") and is_admin(msg) then
            local txt = {string.match(msg.content_.text_, "^/(leave)(%d+)$")}
            sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, 'ربات با موفقیت از گروه '..txt[2]..' خارج شد😐', 1, 'html')
            tdcli.changeChatMemberStatus(-100 ..txt[2], tonumber(239726711), 'Left')
          end

	 ---------------------------------------- autoleave
          if msg.content_.text_:match('^autoleave on$') then
            sendmsg(chat_id, 0, 0, 1, nil, '<code>Successfull !</code>\n<b>Auto Leave is Activated !</b>', 1, 'html')
            redis:set('autoleave:megacreed', "on")
          end
          if msg.content_.text_:match('^autoleave off$') then
            sendmsg(chat_id, 0, 0, 1, nil, '<code>Successfull !</code>\n<b>Auto Leave is Deactivated !</b>', 1, 'html')
            redis:set('autoleave:megacreed', "off")
          end


		  
		  if (msg.content_.text_:match("^[Cc]ommands (.*)$") or msg.content_.text_:match("^(دستورات) (.*)$")) and is_owner(msg) then
            local matches = {string.match(msg.content_.text_, "^([Cc]ommands) (.*)$")}
			local matchees = {string.match(msg.content_.text_, "^(دستورات) (.*)$")}
            if matches[2] == "en" or matchees[2] == "انگلیسی" then
              redis:set('commands:megacreed'..msg.chat_id_, "en")
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = "<b>Commands Language Has been Set to :</b> <code>English</code>"
              else
                text = "<b>زبان دستورات  ربات تنظيم شد به :</b> <code>انگلیسی</code>"
              end
              sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, text, 1, "html")
            elseif matches[2] == "fa" or matchees[2] == "فارسی" then
              redis:set('commands:megacreed'..msg.chat_id_, "fa")
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = "<b>Commands Language Has been Set to :</b> <code>Persian</code>"
              else
                text = "<b>زبان دستورات  ربات تنظيم شد به :</b> <code>فارسی</code>"
              end
              sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, text, 1, "html")
            end
          end
		  
		  
        if ((msg.content_.text_:match("^[Ss]etaccess (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(دسترسی برای) (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
            local matches = {string.match(msg.content_.text_, "^([Ss]etaccess) (.*)$")}
			local matchees = {string.match(msg.content_.text_, "^(دسترسی برای) (.*)$")}
            if matches[2] == "owner" or matchees[2] == "مدیر" then
              redis:set('gp:cmd:megacreed'..msg.chat_id_, "owner")
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = "<b>Commands premission Set Only For :</b> `Owner`"
              else
                text = "✅دسترسی به بخش❗️ تنظیم شد به: <code>مدير</code>"
              end
              sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:cmd') or text), 1, "html")
            elseif matches[2] == "mod" or matchees[2] == "ناظم" then
              redis:set('gp:cmd:megacreed'..msg.chat_id_, "mod")
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = "<b>Commands premission Set Only For :</b> `Moderators`"
              else
                text = "✅دسترسی به بخش❗️ تنظیم شد به: <code>ناظم ها</code>"
              end
              sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:cmd') or text), 1, "html")
            elseif matches[2] == "all" or matchees[2] == "همه" then
              redis:set('gp:cmd:megacreed'..msg.chat_id_, "all")
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = "<b>Commands premission Set Only For :</b> <code>All Members</code>"
              else
                text = "✅دسترسی به بخش❗️ تنظیم شد به: <code>همه</code>"
              end
              sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:cmd') or text), 1, "html")
            end
          end


          if (msg.content_.text_:match("^[Aa]dd$") or msg.content_.text_:match("^نصب$")) and is_admin(msg) then
		  if msg.content_.text_:match("^[Aa]dd$") then
			text = '<b>Group is Already added !</b>'
			else
			text = '<b>گروه از قبل نصب شده است !</b>'
			end
            if  redis:sismember('groups:megacreed',chat_id) then
              return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
            end
            sendmsg(-1001095981481, 0, 0, 1, nil, 'کاربر '..get_info(msg.sender_user_id_)..' یک گروه بهلیست من اضافه کرد🙄', 1, 'html')
            redis:sadd('groups:megacreed',chat_id)
            redis:set('floodtime:megacreed'..chat_id, tonumber(3))
            redis:set('bot:enable:megacreed'..msg.chat_id_,true)
            redis:set('floodnum:megacreed'..chat_id, tonumber(5))
            redis:set('maxspam:megacreed'..chat_id, tonumber(2000))
			redis:set('setlock:megacreed'..chat_id, "del")
            redis:set('owners:megacreed'..chat_id, msg.sender_user_id_)
			redis:setex('bot:charge:megacreed'..msg.chat_id_,86400,true)
            redis:sadd('owner_gps:megacreed'..msg.sender_user_id_,msg.chat_id_)
			if msg.content_.text_:match("^[Aa]dd$") then
			texxt = '<b>Group Has Been Added By</b> : '..get_info(msg.sender_user_id_)..' <b>And Adder Has been set as Owner !</b>'
			else
			texxt = '⚠️این گروه به لیست گروه های تحت مراقبت من اضافه شد😉'
			end
			redis:incr('group:adds'..msg.sender_user_id_)
            sendmsg(chat_id, msg.id_, 0, 1, nil, texxt, 1, 'html')
          end
          -------------------------------------------------------------------------------------------------------------------------------------------
          if (msg.content_.text_:match("^[Rr]em$") or msg.content_.text_:match("^حذف$")) and is_admin(msg) then
		  if msg.content_.text_:match("^[Rr]em") then
			text = '<b>Group is not Added  !</b>'
			else
			text = '<b>گروه از قبل نصب نبوده است  !</b>'
			end
            if not redis:sismember('groups:megacreed',chat_id) then
              return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
            end
	     redis:srem('groups:megacreed',chat_id)
		 if msg.content_.text_:match("^[Rr]em") then
			texxt = '<b>Group Has Been Removed By</b> : '..get_info(msg.sender_user_id_)..''
			else
			texxt = '⚠️ این گروه از لیست گروه های تحت مراقبت من حذف شد☹️'
			end
			sendmsg(-1001095981481, 0, 0, 1, nil, 'کاربر '..get_info(msg.sender_user_id_)..' یک گروه از لیستم حذف کرد🙄', 1, 'html')
			redis:decr('group:adds'..msg.sender_user_id_)
            sendmsg(chat_id, msg.id_, 0, 1, nil, texxt, 1, 'html')
            redis:del('owners:megacreed'..chat_id)
            redis:srem('owner_gps:megacreed'..msg.sender_user_id_,msg.chat_id_)
            redis:del('promotes:megacreed'..chat_id)
            redis:del('muteusers:megacreed'..chat_id)
            redis:del('mute_user:megacreed'..chat_id)
            redis:set('floodtime:megacreed'..chat_id, tonumber(3))
            redis:set('floodnum:megacreed'..chat_id, tonumber(5))
            redis:set('maxspam:megacreed'..chat_id, tonumber(2000))
            redis:hdel(chat_id , 'lock_username:megacreed')
			redis:hdel(chat_id , 'lock_mention:megacreed')
            redis:hdel(chat_id , 'lock_links:megacreed')
            redis:hdel(chat_id , 'lock_bots:megacreed')
            redis:hdel(chat_id , 'lock_tag:megacreed')
            redis:hdel(chat_id , 'lock_forward:megacreed')
            redis:hdel(chat_id , 'lock_persian:megacreed')
            redis:hdel(chat_id , 'lock_english:megacreed')
            redis:hdel(chat_id , 'lock_fosh:megacreed')
            redis:hdel(chat_id , 'lock_location:megacreed')
            redis:hdel(chat_id , 'lock_edit:megacreed')
            redis:hdel(chat_id , 'lock_caption:megacreed')
            redis:hdel(chat_id , 'lock_emoji:megacreed')
            redis:hdel(chat_id , 'lock_inline:megacreed')
            redis:hdel(chat_id , 'lock_reply:megacreed')
            redis:hdel(chat_id , 'lock_spam:megacreed')
            redis:hdel(chat_id , 'lock_shortmsg:megacreed')
            redis:hdel(chat_id , 'lock_flood:megacreed')
            redis:del('mute_all:megacreed'..chat_id)
            redis:del('mute_text:megacreed'..chat_id)
            redis:del('mute_game:megacreed'..chat_id)
            redis:del('mute_sticker:megacreed'..chat_id)
            redis:del('mute_contact:megacreed'..chat_id)
            redis:del('mute_gif:megacreed'..chat_id)
            redis:del('mute_voice:megacreed'..chat_id)
            redis:del('mute_weblink:megacreed'..chat_id)
            redis:del('mute_weblink:megacreed'..chat_id)
            redis:del('mute_keyboard:megacreed'..chat_id)
            redis:del('mute_photo:megacreed'..chat_id)
            redis:del('mute_audio:megacreed'..chat_id)
            redis:del('mute_video:megacreed'..chat_id)
            redis:del('mute_document:megacreed'..chat_id)
          end
          if not redis:sismember('bot:groupss:megacreeps',msg.chat_id_) then
            redis:sadd('bot:groupss:megacreeps',msg.chat_id_)
          end
		if not redis:get('setlock:megacreed'..msg.chat_id_) then
			redis:set('setlock:megacreed'..msg.chat_id_, "del")
		end

          if not redis:get('bot:charge:megacreed'..msg.chat_id_) then
	redis:set('bot:disable:megacreed'..msg.chat_id_, true)
            if redis:get('bot:enable:megacreed'..msg.chat_id_) then
              redis:del('bot:enable:megacreed'..msg.chat_id_)
			  text = "شارژ اين گروه به اتمام رسيد \nLink : "..(redis:get("bot:group:link"..msg.chat_id_) or "تنظيم نشده").."\nID : "..msg.chat_id_..'\n\nدر صورتي که ميخواهيد ربات اين گروه را ترک کند از دستور زير استفاده کنيد\n\n/leave'..msg.chat_id_..'\nبراي جوين دادن توي اين گروه ميتوني از دستور زير استفاده کني:\n/join'..msg.chat_id_..'\n_________________\nدر صورتي که ميخواهيد گروه رو دوباره شارژ کنيد ميتوانيد از کد هاي زير استفاده کنيد...\n\n<code>براي شارژ 1 ماهه:</code>\n/plan1'..msg.chat_id_..'\n\n<code>براي شارژ 3 ماهه:</code>\n/plan2'..msg.chat_id_..'\n\n<code>براي شارژ نامحدود:</code>\n/plan3'..msg.chat_id_..'\n\n'..(redis:get("bot:charge:time:"..msg.chat_id_) or 'End')
			  text = string.gsub(text, "-100", "")
                sendmsg(-1001095981481, 0, 0, 1, nil, text, 1, 'html')
              sendmsg(msg.chat_id_, 0,0, 1,nil, 'شارژ اين گروه به اتمام رسيده است !\nربات تا زمانيکه گروه شارژ نشود کار نخواهد کرد\nبراي شارژ کردن گروه خود به @Mr_Creed مراجعه نماييد !\n\n'..(redis:get("bot:charge:time:"..msg.chat_id_) or 'End'), 1, 'html')
            end
          end

          redis:sadd('gp:users:megacreed', msg.sender_user_id_)

        end
        if id:match('^(%d+)') then
          if not redis:get('user:limits'..msg.sender_user_id_) then
            redis:set('user:limits'..msg.sender_user_id_, 3)
          end
		  
		  
		  
		  
		  
		  
		  
		  --------------------------------------------------------
						  --++++++++++++++++++--
          ------------------ if msg to PV bot --------------------
          if msg.content_.text_:match("^([Ii][Dd])$") then
            local matches = {msg.content_.text_:match("^([Ii][Dd]) (.*)")}
            local gid = tonumber(msg.chat_id_)
            local uid = tonumber(msg.sender_user_id_)
            local reply = msg.reply_to_message_id_
            if not matches[2] and reply == 0 then
              local function dl_photo(arg,data)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = 'Bot ID : '..msg.chat_id_..'\nYour ID : '..msg.sender_user_id_
                else
                  text = 'آيدي ربات : '..msg.chat_id_..'\nآيدي کاربر : '..msg.sender_user_id_
                end
                tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_, text)
              end
              tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.sender_user_id_,offset_ = 0,limit_ = 1}, dl_photo, nil)
              return
            elseif reply ~= 0 then
              get_msg(reply,gid,idby_reply,{gid=gid,id=reply})
            end
          end
          ---------------------------------------------------------
          ------------------ End of Msg Pv Bot --------------------
          ---------------------------------------------------------


      ----------------------------------------------------------------------------------------

      if msg and redis:sismember('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_) then
print("Baned user")
        chat_kick(msg.chat_id_, msg.sender_user_id_)
      end

      if msg and redis:sismember('bot:gbanned:megacreed', msg.sender_user_id_) then
print("Gbaned user")
        chat_kick(msg.chat_id_, msg.sender_user_id_)
      end

	  if msg and redis:sismember('muteusers:megacreed'..msg.chat_id_, msg.sender_user_id_) and not (is_mod(msg) or is_owner(msg) or is_allowed(msg) or is_admin(msg) or is_sudo(msg)) then
	  tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
	  end
if msg and redis:get('mute_all:megacreed'..msg.chat_id_) and not is_mod(msg) then
	tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
      end
      if msg.content_.text_:match("^stats$") and is_admin(msg) then
        local gps = redis:scard("groups")
        local users = redis:scard('bot:userss:megacreed')
        local allmgs = redis:get('bot:allmsgs:megacreed')
		local allgps = redis:scard('bot:groupss:megacreeps')
        sendmsg(chat_id, msg.id_, 0, 1, nil, '*Stats*\n\n🌀تعداد کل گروه ها: `'..gps..'`\n🌀تعداد پی وی ها: `'..users..'`\n🌀تعداد پیام ها: `'..allmgs..'`\n_> All Groups Ever :_ ` '..allgps..'`', 1, 'md')
      end
      ---------------------------------------------------------------------------------------------------------------------------------


      if msg.content_.text_:match("^[Rr]eload$")  and is_sudo(msg) then
        io.popen("sudo killall tg")
        sendmsg(chat_id, msg.id_, 0, 1, nil, '<b>Bot Has been Reloaded !</b>', 1, 'html')
      end

      if msg.content_.text_:match("^bcgp (.*)") and is_sudo(msg) then
        for k,v in pairs(redis:smembers('bot:groupss:megacreeps')) do
          sendmsg(v, 0, 0, 1, nil, msg.content_.text_:match("^bcgp (.*)"), 1 , 'html')
        end
        return
      end

      if msg.content_.text_:match("^bcuser (.*)") and is_sudo(msg) then
        for k,v in pairs(redis:smembers('bot:userss:megacreed')) do
          sendmsg(v, 0, 0, 1, nil, msg.content_.text_:match("^bcuser (.*)"), 1 , 'html')
        end
        return
      end
	  if msg.content_.text_:match("^[Bb]cowners (.*)") and is_admin(msg) then
              for k,v in pairs(redis:smembers('groups:megacreed')) do
			  if redis:get('owners:megacreed'..v) then
			   owner = redis:get('owners:megacreed'..v)
                sendmsg(owner, 0, 0, 1, nil, msg.content_.text_:match("^[Bb]cowners (.*)"), 1, 'html')

			  else
			  return
			  end
            end
			sendmsg(msg.chat_id_, 0, 0, 1, nil, 'Successfully Sent Message to Owners of The Bot Groups !', 1, 'html')
			end
		

      -----------------------------------------------------------------------------------------------------------------------------------------------
      -----------------------------------------------------------------------
      if not is_added(msg) then
	if redis:get('autoleave:megacreed') == "on" then
		if msg.chat_id_:match('-100(%d+)') then
if msg and not is_admin(msg) then
          if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
            text = '*Bot Leaves This Group !*\n*Reason :* `This is Not one of my Groups !`'
          else
            text = '*ربات اين گروه را ترک ميکند !*\n*علت :* `اين گروه جزو گروه هاي ربات نميباشد !`'
          end
          sendmsg(msg.chat_id_, msg.id_, 0 ,1 , nil, text, 1, 'md')
          tdcli.changeChatMemberStatus(chat_id, tonumber(239726711), 'Left')
        end
		end
end

      else
	  get_info(msg.sender_user_id_)
	  redis:get('bot:username'..msg.sender_user_id_)
	  if not redis:get('gp:cmd:megacreed'..msg.chat_id_) then
	  redis:set('gp:cmd:megacreed'..msg.chat_id_, "all")
	  end
	 if ( not is_owner(msg) ) and ( (redis:get('gp:cmd:megacreed'..msg.chat_id_) == "owner") ) then
	 return
	 elseif (not is_mod(msg) ) and ((redis:get('gp:cmd:megacreed'..msg.chat_id_) == "owner") or (redis:get('gp:cmd:megacreed'..msg.chat_id_) == "mod")) then
	 return
	 else
		--------------------------- is added Group now ------------------------------
       if (msg.content_.text_:match("^[Cc]harge (%d+)$") or msg.content_.text_:match("^(تمدید) (%d+)$")) and is_admin(msg) then
    local statstime = io.popen("curl http://api.gpmod.ir/time/"):read("*all")
local timeFA = json.decode(statstime).FAtime
local dateFA = json.decode(statstime).FAdate
          local day = tonumber(86400)
          local ap = {string.match(msg.content_.text_, "^(charge) (%d+)$")}
		  local app = {string.match(msg.content_.text_, "^(تمدید) (%d+)$")}
		  redis:set("bot:charge:time:"..msg.chat_id_ , '✅گروه به مدت '..(ap[2] or app[2])..' روز شارژ شد🙂')    -- 'گروه در تاریخ :'..dateFA..'\nو در زمان :'..timeFA..'\nبه مدته : '..(ap[2] or app[2])..' روز\nتمدید شده بود توسط :'..get_info(msg.sender_user_id)..''
      if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then 
              text = '*Group Charged for* : '..(ap[2] or app[2])..' *Days !*'
            else
              text = '✅گروه به مدت '..(ap[2] or app[2])..' روز شارژ شد🙂', 1, 'md')
            end
          sendmsg(msg.chat_id_, msg.id_, 0 ,1 , nil, text, 1, 'md')
          local time = (ap[2] or app[2]) * day
          redis:setex('bot:charge:megacreed'..msg.chat_id_,time,true)
          redis:set('bot:enable:megacreed'..msg.chat_id_,true)
          redis:del('bot:disable:megacreed'..msg.chat_id_)
        end
		 ---------------------------------------------------------------------------------------------
        if msg.content_.text_:match("^[Cc]hargeset (%d+) (%d+)$") and is_admin(msg) then
          local txt = {string.match(msg.content_.text_, "^(charge) (%d+) (%d+)$")}
          local ex = redis:ttl('bot:charge:megacreed'..txt[2])
            local day = tonumber(86400)
			local time = txt[3] * day
			redis:setex('bot:charge:megacreed'..txt[2],time,true)
          redis:set('bot:enable:megacreed'..txt[2],true)
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = "*After* [ `"..txt[3].."` ] *Days Later Group [ "..txt[2].." ] Will be Expired !*"
            else
              text = "* شارژ اين گروه [ "..txt[2].." ] بعد از * [ `"..txt[3].."` ] *روز ديگر به اتمام ميرسد !*"
            end
            sendmsg(msg.chat_id_, msg.id_, 0 ,1 , nil ,text, 1, 'md')
          end
        end
	 ---------------------------------------------------------------------------------------------
	if msg.content_.text_:match("^chargesec (%d+)$") and is_admin(msg) then
	   redis:del('bot:disable:megacreed'..msg.chat_id_)
          local day = tonumber(1)
          local a = {string.match(msg.content_.text_, "^(chargesec) (%d+)$")}
          sendmsg(msg.chat_id_, msg.id_, 0 ,1 , nil, '*Group Charged for* : `'..a[2]..'` *Seconds !*', 1, 'md')
          local time = a[2] * day
          redis:setex('bot:charge:megacreed'..msg.chat_id_,time,true)
          redis:set('bot:enable:megacreed'..msg.chat_id_,true)
        end
        ---------------------------------------------------------------------------------------------
        if (msg.content_.text_:match("^charge stats$") or msg.content_.text_:match("^تاریخ انقضا$")) and is_mod(msg) then
          local ex = redis:ttl('bot:charge:megacreed'..msg.chat_id_)
          if ex == -1 then
            sendmsg(msg.chat_id_, msg.id_, 0 ,1 , nil ,'*Unlimited !*', 1, 'md')
          else
            local day = tonumber(86400)
            local d = math.floor(ex / day ) + 1
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = "*After* `"..d.."` *Days Later Group Will be Expired !*"
            else
              text = "اعتبار گروه به مدت `"..d.."` شارژ دارد !"
            end
            sendmsg(msg.chat_id_, msg.id_, 0 ,1 , nil , text, 1, 'md')
          end
        end
        ---------------------------------------------------------------------------------------------
        if msg.content_.text_:match("^chargestats (%d+)$") and is_admin(msg) then
          local txt = {string.match(msg.content_.text_, "^(charge stats) (%d+)$")}
          local ex = redis:ttl('bot:charge:megacreed'..txt[2])
          if ex == -1 then
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = '*Unlimited !*'
            else
              text = '*نامحدود !*'
            end
            sendmsg(msg.chat_id_, msg.id_, 0 ,1 , nil  ,text, 1, 'md')
          else
            local day = tonumber(86400)
            local d = math.floor(ex / day ) + 1
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = "*After* `"..d.."` *Days Later Group Will be Expired !*"
            else
              text = "اعتبار گروه به مدت `"..d.."` شارژ دارد !"
            end
            sendmsg(msg.chat_id_, msg.id_, 0 ,1 , nil ,text, 1, 'md')
          end
        end
        ---------------------------------------------------------------------------------------------
        if is_sudo(msg) then
          ---------------------------------------------------------------------------------------------

          ---------------------------------------------------------------------------------------------
          if msg.content_.text_:match('^/plan1(%d+)$') and is_admin(msg) then
            local txt = {string.match(msg.content_.text_, "^/(plan1)(%d+)$")}
            local timeplan1 = 2592000
            redis:setex('bot:charge:megacreed'..-100 ..txt[2],timeplan1,true)
	     redis:del('bot:disable:megacreed'..-100 ..txt[2])
            sendmsg(msg.chat_id_, msg.id_, 0, 1,nil, 'گروه '..txt[2]..' به مدت 30 روز شارژ شد . . . ', 1, 'md')
            sendmsg(-100 ..txt[2], 0, 0, 1,nil, '✅گروه به مدت 30 روز شارژ شد🙂', 1, 'md')
            for k,v in pairs(sudo_users) do
              send(v, 0, 1, "<b>User</b> : "..get_info(msg.sender_user_id_).." <b>Added bot to new group</b>" , 1, 'md')
            end
            redis:set('bot:enable:megacreed'..-100 ..txt[2],true)
          end
          ---------------------------------------------------------------------------------------------
          if msg.content_.text_:match('^/plan2(%d+)$') and is_admin(msg) then
            local txt = {string.match(msg.content_.text_, "^/(plan2)(%d+)$")}
            local timeplan2 = 7776000
	     redis:del('bot:disable:megacreed'..-100 ..txt[2])
            redis:setex('bot:charge:megacreed'..-100 ..txt[2],timeplan2,true)
            sendmsg(msg.chat_id_, msg.id_,0,1,nil, 'گروه '..txt[2]..' به مدت 90 روز شارژ شد . . . ', 1, 'md')
            sendmsg(-100 ..txt[2], 0, 0, 1,nil, '✅گروه به مدت 90 روز شارژ شد🙂', 1, 'md')
            for k,v in pairs(sudo_users) do
              sendmsg(v, 0, 0, 1,nil, "*User"..msg.sender_user_id_.." Added bot to new group*" , 1, 'md')
            end
            redis:set('bot:enable:megacreed'..-100 ..txt[2],true)
          end
          ---------------------------------------------------------------------------------------------
          if msg.content_.text_:match('^/plan3(%d+)$') and is_admin(msg) then
            local txt = {string.match(msg.content_.text_, "^/(plan3)(%d+)$")}
            redis:set('bot:charge:megacreed'..-100 ..txt[2],true)
	     redis:del('bot:disable:megacreed'..-100 ..txt[2])
            sendmsg(msg.chat_id_, msg.id_,0, 1,nil, 'گروه '..txt[2]..' به صورت نامحدود شارژ شد . . .', 1, 'md')
            sendmsg(-100 ..txt[2], 0,0, 1,nil,'✅گروه به مدت  نامحدود روز شارژ شد🙂', 1, 'md')
            for k,v in pairs(sudo_users) do
              sendmsg(v, 0, 0, 1,nil, "*User"..msg.sender_user_id_.." Added bot to new group*" , 1, 'md')
            end
            redis:set('bot:enable:megacreed'..-100 ..txt[2],true)
          end

          if msg.content_.text_:match('/join(%d+)$') and is_admin(msg) then
            local txt = {string.match(msg.content_.text_, "^/(join)(%d+)$")}
            sendmsg(msg.chat_id_, msg.id_,0, 1,nil, 'با موفقيت تورو به گروه '..txt[2]..' اضافه کردم.', 1, 'md')
            sendmsg(-100 ..txt[2], 0, 0, 1,nil, '"Admin Joined!🔸', 1, 'md')
            tdcli.addChatMember(-100 ..txt[2], msg.sender_user_id_, 10)
          end
        end
        ---------------------------------------------------------------------------------------------------------

        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        --- Rmsg , Clean [Bots, Modlist , Rules] , Id , Owner , Moderators , Kick , Ban , Muteuser ----
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------
        -------------[[_______________________________________________________________________]]------------------

        ---------------------------------------------------------------------------------------------------------
		if redis:get('bot:disable:megacreed'..msg.chat_id_) then
	      return
		else
        if not redis:hget(msg.chat_id_, 'lang:megacreed') then
          redis:hset(msg.chat_id_,'lang:megacreed', "en")
        end

		    -----------------------------------------------------------------------------------------------
		  local fosh = {'مادر خراب', 'توله سگ', 'دیوث', 'کسکش','سیک','بیناموس','حروم زاده','بالا باش','حرومی', 'زنا زاده', 'بی شرف','بالا باش'}
		  if msg.content_.text_:match("^فحش بده به (.*)$") then
		  local matches = {string.match(msg.content_.text_, "^(فحش بده به) (.*)$")}
		  if not is_sudo(msg) then
		  sendmsg(chat_id, 0, 0, 1, nil, 'هوی '..get_info(msg.sender_user_id_)..'\n کسکش فک کردی بهت پا میدم ؟' , 1, 'md')
		  else
				for k,v in pairs(fosh) do
					sendmsg(chat_id, 0, 0, 1, nil, matches[2].." ".. fosh[k], 1, 'md')
				end
			end
		  end 
          if (msg.content_.text_:match("^[Ss]etlang fa$") or msg.content_.text_:match("^(زبان فارسی)$")) and is_owner(msg) then
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "fa" then
              text = "زبان گروه از قبل فارسي بود !"
            else
              text = "*Group Language Has been Set to :* `Farsi ( Persian )`"
            end
            redis:hset(msg.chat_id_,'lang:megacreed', "fa")
            sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:setlang') or text), 1 , "md")
          end
			
		if ((msg.content_.text_:match("^[Cc]heck$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(آمار)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
			function user_username(arg, data)
					username = data.username_
					redis:hset('username:user',data.id_ ,username)
					return username
				end
				function user_name(arg, data)
					 name = data.first_name_
					 redis:hset('name:user',data.id_ ,name)
					return name
				end
				function user_lastname(arg, data)
					 lastname = (data.last_name_ or '')
					 redis:hset('lastname:user',data.id_ ,lastname)
					return lastname
				end
		local function get_user_stats(extra , result, success)
			vardump(data)
				 tdcli_function ({ ID = "GetUser", user_id_ = result.sender_user_id_ }, user_username, nil)
				 tdcli_function ({ ID = "GetUser", user_id_ = result.sender_user_id_ }, user_name, nil)
				 tdcli_function ({ ID = "GetUser", user_id_ = result.sender_user_id_ }, user_lastname, nil)
				 redis:hget('username:user',result.sender_user_id_)
				 redis:hget('name:user',result.sender_user_id_)
				 redis:hget('lastname:user',result.sender_user_id_)
				 username = redis:hget('username:user',result.sender_user_id_)
				 name = redis:hget('name:user',result.sender_user_id_)
				 lastname = redis:hget('lastname:user',result.sender_user_id_)
				 kicks = (redis:get('kicks:user:megacreed'..result.sender_user_id_) or '<code>Not Kicked !</code>')
				 bans = (redis:get('bans:user:megacreed'..result.sender_user_id_) or '<code>Not Banned !</code>')
				 msgs = redis:get('bot:usermsgs:megacreed'..result.chat_id_..":"..result.sender_user_id_)
				additional = (redis:get('user:addition'..result.sender_user_id_) or '<code>No Addition !</code>')
				if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
				text = '<b>Users name :</b> <code>'..name..'</code>\n<b>Username </b> : @'..(username or '<code>not Set</code>')..'\n<b>Last Name :</b> <code>'..(lastname or 'not Set')..'</code>\n<b>User Kicked Times :</b> [ '..kicks..' ]\n<b>Additional Name :</b> '..additional..'\n<b>Total Msgs</b> : <code>'..msgs..'</code>\n<b>Total Bans</b> : [ '..bans..' ]\n<b>User Warns : </b><code>'..(redis:get('warns:megacreed'..result.chat_id_..result.sender_user_id_) or 0 )..'</code>'
				else
				text = '👤 نام :  <code>'..name..'</code>\n⭐️ يوزرنيم : @'..(username or '<code>تنظیم نشده</code>')..'\n👥 نام خانوادگي : <code>'..(lastname or 'تنظیم نشده')..'</code>\n💩 تعداد دفعات اخراج شده :  [ '..kicks..' ]\n😈 لقب : '..additional..'\n👾 تعداد پيم هاي ارسال شده : <code>'..msgs..'</code>\n🚫بن : [ '..bans..' ]\n⚠️ اخطار: <code>'..(redis:get('warns:megacreed'..result.chat_id_..result.sender_user_id_) or 0 )..'</code>'
				text = string.gsub(text , '<code>Not Kicked !</code>', '<code>اخراج نشده</code>')
				text = string.gsub(text , '<code>Not Banned !</code>', '<code>مسدود نشده</code>')
				text = string.gsub(text , '<code>No Addition !</code>', '<code>فاقد لقب</code>')
				end
				text = string.gsub(text, "#bot", "")
				sendmsg(result.chat_id_, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:check') or text), 1, 'html')
				end
				tdcli.getMessage(msg.chat_id_, msg.reply_to_message_id_,get_user_stats)
			end
			
		
          if (msg.content_.text_:match("^[Ss]etlang en$") or msg.content_.text_:match("^(زبان انگلیسی)$")) and is_owner(msg) then
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "fa" then
              text = "*زبان گروه تغيير کرد به :* `انگليسي`"
            else
              text = "*Group Language is Already English !*"
            end
            redis:hset(msg.chat_id_,'lang:megacreed', "en")
            sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:setlang') or text), 1 , "md")
          end

          if (msg.content_.text_:match("^[Ll]ang$") or msg.content_.text_:match("^(زبان)$")) and is_mod(msg) then
            if redis:hget(msg.chat_id_ , 'lang:megacreed') == "fa" then
              text = "زبان گروه فارسي ميباشد !"
            else
              text = "*Group Language is English !*"
            end
            sendmsg(msg.chat_id_, msg.id_, 0, 1, nil , (redis:hget(msg.chat_id_ , 'answer:setlang') or text), 1 , "md")
          end
          -------------------------------------------------------------------------------------------------------
          if ((msg.content_.text_:match("^(setnickname) @(.*) (.*)") and redis:hget(msg.chat_id_, 'lang:megacreed') == "en") or (msg.content_.text_:match("^(تنظیم لقب) @(.*) (.*)") and redis:hget(msg.chat_id_, 'lang:megacreed') == "fa")) and is_sudo(msg) then
		  local matches = {string.match(msg.content_.text_, "^(setnickname) @(.*) (.*)")}
		  local matchees = {string.match(msg.content_.text_, "^(تنظیم لقب) @(.*) (.*)")}
		  function addition_by_username(extra ,result, success)
		  if result.id_ then
		  redis:set('user:addition'..result.id_ , (matches[3] or matchees[3]))
		  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
			text = 'Done !\n<b>User Additional Name Has been Set to :</b> <code>'..matches[3]..'</code>'
			else
			text = '✅لقب کاربرز به <code>'..matchees[3]..'</code> تغییر کرد☺️'
		  end
		  sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, text, 1, "html")
		  else
		  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
			text = 'Error 404!\n<b>User ot Found !</b>'
			else
			text = 'خطای 404!\n<b>کاربر یافت نشد !</b>'
		  end
		  sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, text, 1, "html")
		  end
		  end
		  if msg.content_.text_:match("^(تنظیم لقب) @(.*) (.*)") then
		  resolve_username(matchees[2], addition_by_username)
		  else 
		  resolve_username(matches[2], addition_by_username)
		  end
		  end
		  if ((msg.content_.text_:match("^(setnickname) (.*)$") and redis:hget(msg.chat_id_, 'lang:megacreed') == "en") or (msg.content_.text_:match("^(تنظیم لقب) (.*)$") and redis:hget(msg.chat_id_, 'lang:megacreed') == "fa")) and msg.reply_to_message_id_ and is_sudo(msg) then
		  local matches = {string.match(msg.content_.text_, "^(setnickname) (.*)")}
		  local matchees = {string.match(msg.content_.text_, "^(تنظیم لقب) (.*)")}
		  function addition_by_reply(extra ,result, success)
		  redis:set('user:addition'..result.sender_user_id_ , (matches[2] or matchees[2]))
		  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
			text = 'Done !\n<b>User Additional Name Has been Set to :</b> <code>'..matches[2]..'</code>'
			else
			text = '✅لقب کاربرز به <code>'..matchees[2]..'</code> تغییر کرد☺️'
		  end
		  sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, text, 1, "html")
		  end
		  tdcli.getMessage(msg.chat_id_, msg.reply_to_message_id_ , addition_by_reply)
		  end
          --------------------------------------------------------------------------------------------------------
          if ((msg.content_.text_:match("^[Mm][Ee]$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^من$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) then
            local allgpmsgs = redis:get('bot:allgpmsgs:megacreed'..msg.chat_id_)
			username = redis:hget('username:user',result.sender_user_id_)
			name = redis:hget('name:user',result.sender_user_id_)
			lastname = redis:hget('lastname:user',result.sender_user_id_)
			additional = (redis:get('user:addition'..result.sender_user_id_) or '<code>No Addition !</code>')
            local usermsgs = redis:get('bot:usermsgs:megacreed'..msg.chat_id_..":"..msg.sender_user_id_)
            local percent =  tonumber((usermsgs / allgpmsgs) * 100)
            local top = 1
            for k,v in pairs(redis:hkeys('bot:usermsgs:megacreed'..msg.chat_id_..":*")) do
              if redis:get('bot:usermsgs:megacreed'..msg.chat_id_":"..v) > top then
                top = redis:get('bot:usermsgs:megacreed'..msg.chat_id_":"..v)
              end
            end
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = "<b>Your Messages :</b> <code>"..usermsgs.."</code>\n<b>Groups Messages :</b> <code>"..allgpmsgs.."</code>\n<b>Your Message Percent :</b> <code>%"..string.sub(percent, 1, 4).."</code>\n<b>Your Info : </b>"..get_info(msg.sender_user_id_)
            else
              text = "🌟نام:  <code>'..name..'</code>\n💫یوزرنیم: @'..(username or '<code>تنظیم نشده</code>')..'\n👥 نام خانوادگي : <code>'..(lastname or 'تنظیم نشده')..'</code>\n⭐️لقب: : '..additional..'\n✨تعداد پیام :</b> <code>"..usermsgs.."</code>\n<b>تعداد پيام هاي گروه :</b> <code>"..allgpmsgs.."</code>\n<b>درصد پيام هاي شما :</b> <code>%"..string.sub(percent, 1, 4).."</code>\n<b>اطلاعات شما : </b>\n"..get_info(msg.sender_user_id_)
			  text = string.gsub(text , '<code>Not Kicked !</code>', '<code>اخراج نشده</code>')
			  text = string.gsub(text , '<code>Not Banned !</code>', '<code>مسدود نشده</code>')
			  text = string.gsub(text , '<code>No Addition !</code>', '<code>فاقد لقب</code>')
            end
            sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:me') or text), 1, "html")
          end

local function delmsg (arg,data)
    msgs = arg.msgs 
    for k,v in pairs(data.messages_) do
        msgs = msgs - 1
        del_msgs(v.chat_id_,{[0] = v.id_}, dl_cb, cmd)
        if msgs == 1 then
            del_msgs(data.messages_[0].chat_id_,{[0] = data.messages_[0].id_}, dl_cb, cmd)
            return false
        end
    end
    tdcli.getChatHistory(data.messages_[0].chat_id_, data.messages_[0].id_,0 , 100, delmsg, {msgs=msgs})
end
	 -----------------------------------------------------------------------------------------------------------------------
		  if ((msg.content_.text_:match("^([Uu]nlimite) (.*) @(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف مجوز) (.*) @(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
		  		local matches = {string.match(msg.content_.text_, "^([Uu]nlimite) (.*) @(.*)$")}
				local matchees = {string.match(msg.content_.text_, "^(حذف مجوز) (.*) @(.*)$")}
				local function remlimit_username(extra , result , success)
		  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '*Done !*\n*User :* @'..(matches[3] or matchees[3])..' *Limits For sending Media has been Removed Successfully !*'
              else
                text = '✅ محدودیت های کاربر @'..(matches[3] or matchees[3])..' صفر شد😊'
              end
			  redis:hset(msg.chat_id_..'limit:megacreed:media'..result.id_ ,(matches[2] or matchees[2]), 0)
			  sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, text, 1, 'md')
			  end
			  if msg.content_.text_:match("^([Uu]nlimite) (.*) @(.*)$") then 
			  resolve_username(matches[3] , remlimit_username)
			  else 
			  resolve_username(matchees[3] , remlimit_username)
			  end
		  end
		  -----------------------------------------------------------------------------------------------------------------------
		  if ((msg.content_.text_:match("^([Uu]nlimite) (.*) @(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف مجوز) (.*) @(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
		  		local matches = {string.match(msg.content_.text_, "^([Uu]nlimite) (.*) @(.*)$")}
				local matchees = {string.match(msg.content_.text_, "^(حذف مجوز) (.*) @(.*)$")}
				local function remlimit_username(extra , result , success)
				values = {
			'location',
			'caption',
			'tag',
			'username',
			'persian',
			'emoji',
			'english',
			'fosh',
			'inline',
			'spam',
			'flood',
			'shortmsg',
			'mention',
			'links',
			'bots',
			'forward',
			'edit',
			}
			for k,v in pairs(values) do
			if matches[2] == v then
		  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '<b>Done !</b>\n<b>User :</b> @'..(matches[3] or matchees[3])..' <b>Limits For sending Media has been Removed Successfully !</b>'
              else
                text = '✅ محدودیت های کاربر @'..(matches[3] or matchees[3])..' صفر شد😊'
              end
			  redis:hset(msg.chat_id_..'limit:megacreed:media'..result.id_ ,(matches[2] or matchees[2]), 0)
			  sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, text, 1, 'html')
			  end
			  end
			  end
			  if msg.content_.text_:match("^([Uu]nlimite) (.*) @(.*)$") then 
			  resolve_username(matches[3] , remlimit_username)
			  else 
			  resolve_username(matchees[3] , remlimit_username)
			  end
		  end
          -----------------------------------------------------------------------------------------------------------------------
		  if ((msg.content_.text_:match("^([Ss]etlimit) (.*) @(.*) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(مجوز به) (.*) @(.*) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
			local matches = {string.match(msg.content_.text_, "^([Ss]etlimit) (.*) @(.*) (%d+)$")}
			local matchees = {string.match(msg.content_.text_, "^(مجوز به) (.*) @(.*) (%d+)$")}
			local function limit_username(extra , result , success)
			if result.id_ then
			values = {
			'location',
			'caption',
			'tag',
			'username',
			'persian',
			'emoji',
			'english',
			'fosh',
			'inline',
			'spam',
			'flood',
			'shortmsg',
			'mention',
			'links',
			'bots',
			'forward',
			'edit',
			}
			for k,v in pairs(values) do
			if matches[2] == v then
			  redis:hset(msg.chat_id_..'limit:megacreed:media'..result.id_ ,matches[2],(matches[4] or matchees[4]))
			if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = 'Done !\n<b>Limits for sending media of user :</b> @'..(matches[3] or matchees[3])..' for media '..(matches[2] or matchees[2])..' has been Set to '..(matches[4] or matchees[4])
              else
                text = '🔮محدودیت آیتم  براي كاربر  @'..(matches[3] or matchees[3])..' برای '..(matches[2] or matchees[2])..' بعد از '..(matches[4] or matchees[4])..' پیام تنظیم شد'
              end
			  sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
			end
			end
			end
			end
			if msg.content_.text_:match("^([Ss]etlimit) (.*) @(.*) (%d+)$") then
			resolve_username(matches[3], limit_username)
			else 
			resolve_username(matchees[3], limit_username)
			end
			end
          if msg.content_.text_  then

            local is_link = (msg.content_.text_:find("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.content_.text_:find("[Tt].[Mm][Ee]/"))
		if redis:hget(chat_id , 'lock_links:megacreed') and is_link and (not is_mod(msg) and not is_allowed(msg)) then
		-- setlimit
		limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'links') or tostring(0)
		print(limits)
		if limits > tostring(0) then
		redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'links', limits - tostring(1))
		  else
				if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Links Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال لینک</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Links Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال لینک</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Links Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال لینک</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Links Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال لینک</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Links Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال لینک</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
            end
			end
			
			
			
            if redis:hget(chat_id , 'lock_tag:megacreed') and msg.content_.text_:find("#") and (not is_mod(msg) and not is_allowed(msg)) then
			-- setlimit
			limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'tag') or tostring(0)
			print(limits)
			if limits > tostring(0) then
			redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'tag', limits - tostring(1))
			else
				if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Hashtag[#] Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال هشتگ !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Hashtag[#] Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال هشتگ !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Hashtag[#] Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال هشتگ !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Hashtag[#] Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال هشتگ !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Hashtag[#] Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال هشتگ !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
			end
		end


            if redis:hget(chat_id , 'lock_username:megacreed') and msg.content_.text_:find("@") and (not is_mod(msg) and not is_allowed(msg)) then
			-- setlimit
			limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'username') or tostring(0)
			print(limits)
			if limits > tostring(0) then
			redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'username', limits - tostring(1))
			else
		if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Username[@] Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال یوزرنیم !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Username[@] Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال یوزرنیم !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Username[@] Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال یوزرنیم !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Username[@] Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال یوزرنیم !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Username[@] Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال یوزرنیم !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
            end
			end

            if redis:hget(chat_id , 'lock_persian:megacreed') and msg.content_.text_:find("[\216-\219][\128-\191]") and (not is_mod(msg) and not is_allowed(msg)) then
-- setlimit
			limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'persian') or tostring(0)
			print(limits)
			if limits > tostring(0) then
			redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'persian', limits - tostring(1))
			else
			if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Persian Words Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال حروف فارسی !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Persian Words Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال حروف فارسی !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Persian Words Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال حروف فارسی !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Persian Words Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال حروف فارسی !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Persian Words Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال حروف فارسی !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
            end
		end


            local is_english_msg = msg.content_.text_:find("[a-z]") or msg.content_.text_:find("[A-Z]")
            if redis:hget(chat_id , 'lock_english:megacreed') and is_english_msg and (not is_mod(msg) and not is_allowed(msg)) then
			-- setlimit
			limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'english') or tostring(0)
			print(limits)
			if limits > tostring(0) then
			redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'english', limits - tostring(1))
			else
		if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>English Words Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال حروف انگلیسی !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>English Words Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال حروف انگلیسی !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>English Words Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال حروف انگلیسی !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>English Words Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال حروف انگلیسی !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>English Words Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال حروف انگلیسی !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
            end
			end

            local is_fosh_msg = msg.content_.text_:find("کير") or msg.content_.text_:find("کص") or msg.content_.text_:find("کون") or msg.content_.text_:find("85") or msg.content_.text_:find("جنده") or msg.content_.text_:find("ننه") or msg.content_.text_:find("ننت") or msg.content_.text_:find("مادر") or msg.content_.text_:find("قهبه") or msg.content_.text_:find("گايي") or msg.content_.text_:find("سکس") or msg.content_.text_:find("kir") or msg.content_.text_:find("kos") or msg.content_.text_:find("kon") or msg.content_.text_:find("nne") or msg.content_.text_:find("nnt")
            if redis:hget(chat_id , 'lock_fosh:megacreed') and is_fosh_msg and (not is_mod(msg) and not is_allowed(msg)) then
		-- setlimit
			limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'fosh') or tostring(0)
			print(limits)
			if limits > tostring(0) then
			redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'fosh', limits - tostring(1))
			else
if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Badwords Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال فحش !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Badwords Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال فحش !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Badwords Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال فحش !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Badwords Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال فحش !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Badwords Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال فحش !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
            end
		end

	is_emoji_msg = msg.content_.text_:find("😀") or msg.content_.text_:find("😬") or msg.content_.text_:find("😁") or msg.content_.text_:find("😂") or  msg.content_.text_:find("😃") or msg.content_.text_:find("😄") or msg.content_.text_:find("😅") or msg.content_.text_:find("☺️") or msg.content_.text_:find("🙃") or msg.content_.text_:find("🙂") or msg.content_.text_:find("😊") or msg.content_.text_:find("😉") or msg.content_.text_:find("😇") or msg.content_.text_:find("😆") or msg.content_.text_:find("😋") or msg.content_.text_:find("😌") or msg.content_.text_:find("😍") or msg.content_.text_:find("😘") or msg.content_.text_:find("😗") or msg.content_.text_:find("😙") or msg.content_.text_:find("😚") or msg.content_.text_:find("🤗") or msg.content_.text_:find("😎") or msg.content_.text_:find("🤓") or msg.content_.text_:find("🤑") or msg.content_.text_:find("😛") or msg.content_.text_:find("😏") or msg.content_.text_:find("😶") or msg.content_.text_:find("😐") or msg.content_.text_:find("😑") or msg.content_.text_:find("😒") or msg.content_.text_:find("🙄") or msg.content_.text_:find("🤔") or msg.content_.text_:find("😕") or msg.content_.text_:find("😔") or msg.content_.text_:find("😡") or msg.content_.text_:find("😠") or msg.content_.text_:find("😟") or msg.content_.text_:find("😞") or msg.content_.text_:find("😳") or msg.content_.text_:find("🙁") or msg.content_.text_:find("☹️") or msg.content_.text_:find("😣") or msg.content_.text_:find("😖") or msg.content_.text_:find("😫") or msg.content_.text_:find("😩") or msg.content_.text_:find("😤") or msg.content_.text_:find("😲") or msg.content_.text_:find("😵") or msg.content_.text_:find("😭") or msg.content_.text_:find("😓") or msg.content_.text_:find("😪") or msg.content_.text_:find("😥") or msg.content_.text_:find("😢") or msg.content_.text_:find("🤐") or msg.content_.text_:find("😷") or msg.content_.text_:find("🤒") or msg.content_.text_:find("🤕") or msg.content_.text_:find("😴") or msg.content_.text_:find("💋") or msg.content_.text_:find("❤️")
            if redis:hget(chat_id , 'lock_emoji:megacreed') and is_emoji_msg and (not is_mod(msg) and not is_allowed(msg))  then
-- setlimit
			limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'emoji') or tostring(0)
			print(limits)
			if limits > tostring(0) then
			redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'emoji', limits - tostring(1))
			else
			if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Emoji Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال شکلک !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Emoji Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال شکلک !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Emoji Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال شکلک !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Emoji Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال شکلک !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Emoji Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال شکلک !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
            end
		end

            if redis:hget(chat_id , 'lock_inline:megacreed') and  msg.via_bot_user_id_ ~= 0 and (not is_mod(msg) and not is_allowed(msg)) then
			-- setlimit
			limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'inline') or tostring(0)
			print(limits)
			if limits > tostring(0) then
			redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'inline', limits - tostring(1))
			else
if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Inline Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال اینلاین !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Inline Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال اینلاین !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Inline Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال اینلاین !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Inline Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال اینلاین !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Inline Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال اینلاین !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
			end
		end
		
		
		
            if redis:hget(chat_id , 'lock_reply:megacreed') and  msg.reply_to_message_id_ and (not is_mod(msg) ~= 0  or not is_allowed(msg) ~= 0) then
			-- setlimit
			limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'reply') or tostring(0)
			print(limits)
			if limits > tostring(0) then
			redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'reply', limits - tostring(1))
			else
				if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Reply Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>پاسخ به پیام !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Reply Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>پاسخ به پیام !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Reply Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>پاسخ به پیام !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Reply Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>پاسخ به پیام !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Reply Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>پاسخ به پیام !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
			  end
            end

            if redis:get('mute_user:megacreed'..chat_id) and is_normal(msg) then
              tdcli.deleteMessages(chat_id, {[0] = msg.id_})
            end

            for k,v in pairs(redis:smembers('filters:megacreed'..msg.chat_id_)) do
              if string.match(msg.content_.text_:lower(), v) and (not is_mod(msg) and not is_allowed(msg)) then
                tdcli.deleteMessages(chat_id, {[0] = msg.id_})
              end
            end
          end

          if ((msg.content_.text_:match("^[Cc]lean bots$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^پاکسازی ربات ها$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            local function g_bots(extra,result,success)
              local bots = result.members_
              for i=0 , #bots do
                chat_kick(msg.chat_id_,bots[i].user_id_)
              end
            end
            local function channel_get_bots(chat_id,cb)
              local function callback_admins(extra,result,success)
                limit = result.member_count_
                tdcli.getChannelMembers(channel, 0, 'Bots', limit,cb)
              end
              tdcli.getChannelFull(msg.chat_id_,callback_admins)
            end
            channel_get_bots(msg.chat_id_,g_bots)
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = '_>_* All Bots Kicked!*'
            else
              text = '*> تمامي ربات ها پاک شدند !*'
            end
            sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
          end
          if ((msg.content_.text_:match("^[Cc]lean modlist$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^پاکسازی مدیر ها$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            redis:del('promotes:megacreed'..msg.chat_id_)
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = '_>_ *Modlist Has been Cleaned !*'
            else
              text = '*> ليست ناظم ها پاک شد !*'
            end
            sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
          end
		  if ((msg.content_.text_:match("^[Cc]lean filters$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^پاکسازی فیلتر ها$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
		  for k,v in pairs(redis:smembers('filters:megacreed'..msg.chat_id_)) do
            redis:srem('filters:megacreed'..msg.chat_id_, v)
		  end
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = '_>_ *Filters Has been Cleaned !*'
            else
              text = '*> ليست فیلتر ها پاک شد !*'
            end
            sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
          end
          if ((msg.content_.text_:match("^[Cc]lean mutelist$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^پاکسازی ساکت ها$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = '_>_ *Mute List Has been Cleaned !*'
            else
              text = '*> ليست افراد ساکت شده پاک شد !*'
            end
            redis:del('muteusers:megacreed'..msg.chat_id_)
            redis:del('mute_user:megacreed'..msg.chat_id_)
            sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
          end
          if ((msg.content_.text_:match("^[Cc]lean banlist$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^پاکسازی بن ها$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = '_>_ *Ban List Has been Cleaned !*'
            else
              text = '*> ليست اعضاي بن شده پاک شد !*'
            end
            redis:del('bot:banned:megacreed'..msg.chat_id_)
            sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
          end
	   if ((msg.content_.text_:match("^[Cc]lean gbanlist$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^پاکسازی بن گلوبال ها$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_sudo(msg) then
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = '_>_ *Global Ban List Has been Cleaned !*'
            else
              text = '*> ليست اعضاي بن شده همگاني پاک شد !*'
            end
            redis:del('bot:gbanned:megacreed')
            sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
          end
          -------------------------------------------------------------
          if redis:get("bot:group:link"..msg.chat_id_) == 'Link Set Status : `Waiting !`' and is_mod(msg) then
            if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
              local glink = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
              local hash = "bot:group:link"..msg.chat_id_
              redis:set(hash,glink)
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '*New link Has been Set!*'
              else
                text = '*لينک جديد تنظيم شد !*'
              end
              sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
            end
          end
		  redis:set('bot:editid:megacreed'.. msg.id_,msg.content_.text_)
          ------------------------------------------
          if ((msg.content_.text_:match("^[Ii][Dd]$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^ایدی$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) then
            local matches = {msg.content_.text_:match("^[Ii][Dd] (.*)")}
			local matchees = {msg.content_.text_:match("^(ایدی) (.*)$")}
            local gid = tonumber(msg.chat_id_)
            local uid = tonumber(msg.sender_user_id_)
            local reply = msg.reply_to_message_id_
            if (not matches[2] or not matchees[2]) and reply == 0 then
              local function dl_photo(arg,data)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = 'SuperGroup ID : '..string.sub(chat_id, 5,14)..'\nUser ID : '..msg.sender_user_id_
                else
                  text = 'آيدي گروه : '..string.sub(chat_id, 5,14)..'\nآيدي شخص : '..msg.sender_user_id_
                end
                tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_, text)
              end
              tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.sender_user_id_,offset_ = 0,limit_ = 1}, dl_photo, nil)
              return
            elseif reply ~= 0 then
              get_msg(reply,gid,idby_reply,{gid=gid,id=reply})
            end
          end

          if ((msg.content_.text_:match("^[Ss]etrules (.*)") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیم قوانین) (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            local txt = {string.match(msg.content_.text_, "^(setrules) (.*)$")}
			local txxt = {string.match(msg.content_.text_, "^(تنظیم قوانین) (.*)$")}
			if msg.content_.text_:match("^[Ss]etrules (.*)") then
            redis:set('bot:rules:megacreed'..msg.chat_id_, txt[2])
			else
			redis:set('bot:rules:megacreed'..msg.chat_id_, txxt[2])
			end
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = '*Rules Has Been Set !*'
            else
              text = '*قوانين تنظيم شد !*'
            end
            sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:setrules') or text), 1, 'md')
          end
          -----------------------------------------------------------------------------------------------

		  -----------------------------------------------------------------------------------------------
          if ((msg.content_.text_:match("^[Rr]ules") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قوانین)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and msg.chat_id_:match('-100(%d+)') then
            local rules = redis:get('bot:rules:megacreed'..msg.chat_id_)
            if not rules then
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                rules = '<b>No Rules has been Set for this Group !</b>'
              else
                rules = '<b>قوانيني براي اين گروه تنظيم نشده است !</b>'
              end
            end
            sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:rules') or rules), 1, 'html')
          end

          if ((msg.content_.text_:match("^[Pp]in") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(سنجاق)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and msg.reply_to_message_id_ and is_mod(msg) then
            tdcli.pinChannelMessage(msg.chat_id_, msg.reply_to_message_id_, 0)
          end

          if ((msg.content_.text_:match("^[Uu]npin") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف سنجاق)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = '<b>Message UnPinned</b>'
            else
              text = '<b>پيام سنجاق شده برداشته شد !</b>'
            end
            sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:unpin') or text), 1, 'html')
            tdcli.unpinChannelMessage(chat_id)
          end

          -------------------------------------------------------------------

          if ((msg.content_.text_:match("^[Hh]elp") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(راهنما)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and msg.chat_id_:match('^-100(%d+)') and is_mod(msg) then
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "fa" then
			if redis:get('commands:megacreed'..msg.chat_id_) == "en" then
              help = [[ليست دستورات کمکي ربات :
🔸lock [mention(فراخوانی بدون یوزرنیم), shortmsg(پيام هاي کوتاه) , flood(رگباري), spam(متن طولاني), link, tag( پيام حاوي # ) , username ( پيام حاوي @ ), forward , persian (حروف فارسي) , english(حروف انگليسي), reply, fosh, edit(ويرايش پيام) ,location (اشتراک مکان) , caption (عکس و ... شامل متن زيري), inline(استفاده از خاصيت اينلاين رباتا), emoji(شکلک)]
براي قفل کردن( نوع پيام قفل شده حذف ميشود ) يکي از عبارت هاي داخل [] فقط اسم لاتين عبارت را جلوي lock بنويسيد مثلا :
lock tag
- - -  - -
🔸mute [all(تعطيل کردن گروه) , keyboard(دکمه شيشه اي), sticker(استيکر) , game(بازي هاي تلگرامي) , gif(عکس متحرک), contact(اشتراک مخاطب), photo(عکس), audio(ترانه), voice(صدا), video(فيلم), document(فايل), text(پيام متني)]
براي حذف کردن نوع پيام داخل [ ] يکي از عبارات را جلوي mute بزاريد . مثلا :
mute all
- - -- - -
🔸filter [کلمه اي]
براي فيلتر کردن کلمه اي ( کلمه فيلتر شده در صورت مشاهده در پيامي , پيام حذف ميشود )
مثلا :
filter خر

🔸unfilter [کلمه]
براي درآوردن کلمه از ليست کلمات فيلتر شده
🔸filters
براي ديدن ليست کلمات فيلتر شده
- - - - -
🔸setrules [متن قوانين]
براي تعيين متني به عنوان قوانين گروه . مثلا :
setrules لطفا بي ادبي نکنيد

🔸rules
براي گرفتن قوانين تعيين شده توسط ربات
- - - - -
🔸promote [يوزرنيم,آي دي]
براي ارتقاي شخصي به عنوان مدير
promote
با ريپلي کردن به پيام شخصي که ميخواهيد مدير شود اورا مدير کنيد
🔸modlist
براي گرفتن ليست مدير ها
- - - -
🔸settings
براي گرفتن ليست تنظيمات گروه !
🔸id
براي گرفتن ايدي عددي خود زير عکس پروفايلتان و همچنين اي دي عددي گروه
- - - - - - - 
🔸setspam [عددي بين ? تا 🔸🔸]
براي تعيين حذف کردن پيام هايي شامل بيشتر از کاراکتر تعريف شده‌(‌بزرگي پيام )(در صورتي کار ميکنم ک lock spam زده باشيد )
مثلا :
setspam 2000
- - - - - -
🔸setfloodtime [2-20]
براي تعيين مدت زمان( بر حسب ثانيه ) چک کردن تعداد پيام هاي داده شده شخص براي تشخيص رگباري بودن يا نبودن پيام هاش ( معموليش ? هست ) مثلا :
setfloodtime 3

🔸setfloodnum [5-30]
براي تعيين تعداد پيام هاي مجازي رگباري در مدت زمان تعيين شده ( بايد lock flood هم در مورد بالا هم در اين مورد فعال باشد ) مثلا :
setfloodnum 10
- - - - - 
🔸setshortmsg [2-20]
برای تنظیم حداقل پیام با کاراکتر
setshortmsg 10
- - - - -
🔸me
براي دادن آمار پيام ها و شخص فعال گروه
- - - - - -
🔸setlang [fa/en]
براي تنظيم زبان ربات به فارسي يا انگليسي کافيه يکي از اون عبارت هارو بزاري جلوش مثلا :
setlang fa

🔸lang
براي گرفتن زبان گروه
- - - - -
🔸del
با ريپلي به پيام شخص توسط مدير , پيام شخص حذف ميشه
- - - - -
🔸kick [username / id ]
براي حذف کردن شخص از گروه با يوزرنيم يا ايدي عددي شخص , با ريپلي هم بايد خالي بنويسي kick تا حذف کنه
- - - - - -
🔸ban [username / id ]
براي بن کردن شخص از گره تا اگر باري ديگر آمد ربات باز حذفش کنه
🔸unban [username / id]
براي آنبن کردن شخص تا بتونه بياد
🔸banlist
براي ديدن ليست اعضاي بن شده
- - - - - -
🔸muteuser [username / id]
براي سايلنت کردن شخص با يوزرنيم يا آيدي عددي , با ريپلي هم خالي بنويس muteuser
شخص اگر حرف بزنه پيامش حذف ميشه
🔸unmuteuser [username / id]
براي خارج کردن شخص از ليست سايلنت شده ها , با ريپلي ساده بنويس unmuteuser
🔸mutelist
براي ديدن ليست اعضاي حذف شده !
- - - - - - -
🔸setname (اسم گروه)
براي تغير اسم گروه
🔸edit (متن)
با ريپلي کردن به يه پيام ربات و نوشتن متنتون , ربات پيام خودشو به متن شما تغيير ميده و اديت ميکنه
- - - - -
🔸pin
با ريپلي به پيامي ربات پيام شما رو پين ميکنه
🔸unpin
ساده بنويسيد تا ربات پيام پين شده رو برداره
- - - - - -
🔸clean [modlist/bots/banlist/mutelist]
براي پاک کردن ليست مديرت ها و ربات هاي گروه و اعضاي بن شده و اعضاي ساکت شده به کار ميره مثلا :
clean mutelist
کانال ما : @TearTeam
حتما جوين دهيد تا از دستورات و آپديت هاي جديد با خبر باشيد !‌
- - - - 
🔸welcome enable/disable
برای فعال یا غیر فعال کردن خوشامد گویی 

🔸setwelcome Text
برای تنظیم متن خوشامد گویی 

🔸reset all
برای بازگرداندن تمامی تنظیمات گروه به حالت اولیه

🔸commands en/fa
برای تنظیم زبان دستورات

]] 
else
 help = [[
🔰<code>حذف</code> [همه , بازی , استیکر , گیف , زیبانویس , سایت , کیبورد , مخاطب , عکس , ترانه , صدا , فیلم , فایل , متن ]
برای تعیین اینکه ربات چه نوع پیامی رو وقتی دید حذف بکنه
🔰<code>بازکردن</code> [همه , بازی , استیکر , گیف , زیبانویس , سایت , کیبورد , مخاطب , عکس , ترانه , صدا , فیلم , فایل , متن ]
باز کردن تنظیماتی که در بالا قفل کرده اید !
🔰<code>قفل</code>  [لینک , ربات , فراخوانی , یوزرنیم , تگ , فارسی , فوروارد , فحش , مکان , ویرایش , زیرنویس , شکلک , اینلاین , انگلیسی , پاسخ , سرویس , پیام طولانی , پیام کوتاه , رگباری]
برای اینکه ربات این نوع محتوا رو قفل کنه و متناسب با تنظیماتی که برای قفل ها تعیین کرده اید با شخص رفتار بکنه
🔰<code>رهایی</code> [لینک , ربات , فراخوانی , یوزرنیم , تگ , فارسی , فوروارد , فحش , مکان , ویرایش , زیرنویس , شکلک , اینلاین , انگلیسی , پاسخ , سرویس , پیام طولانی , پیام کوتاه , رگباری]  
برای بازکردن تنظیماتی که قبلا قفل شده است 
🔰<code>اخطار</code>
برای اخطار دادن ب شخص
🔰<code>حذف اخطار </code>
برای حذف کردن اخطار شخص 
🔰<code>ارتقا</code>
برای ارتقا به مدیری
🔰<code>تنزیل</code>
برای تنزیل شخص از مدیری
🔰<code>لیست مدیر ها</code>
لیست مدیرانی که ارتقا یافته
🔰<code>تنظیم سازنده</code>
برای تنظیم سازنده ی گروه که به بعضی از دسترسی ها مانند تعیین مدیر ها دسترسی دارد
🔰<code>سازنده</code>
برای دیدن سازنده ی فعلی گروه
🔰<code>اخراج</code>
برای اخراج شخص از گروه
🔰<code>مسدود</code>
برای مسدود کردن شخص . شخص مسدود شده هروقت به گروه بازگردد ربات او را اخراج میکند !
🔰<code>حذف مسدودیت</code>
برای برداشتن شخص از لیست مسدودان گروه
🔰<code>لیست مسدود ها</code>
برای دیدن لیست مسدود ها
🔰<code>ساکت</code>
برای اینکه شخصی را ساکت بکنید  تا ربات پیام های او را حذف بنماید !
🔰<code>حذف ساکت</code>
برای دراوردن شخصی از حالت ساکتی
🔰<code>تنظیم پیام رگباری [عدد]</code>
برای تعیین پیام رگباری
🔰<code>تنظیم پیام طولانی [عدد]</code>
برای تعیین تعداد کاراکتر پیام طولانی
🔰<code>تنظیم اخطار به [اخراج , مسدود]</code>
برای اینکه اگر اخطار های شخص تمام شد چه عکسالعملی ربات با او داشته باشد !
🔰<code>نهایت اخطار [عدد]</code>
برای تعیین نهایت اخطار گرفتن اشخاص 
🔰<code>تنظیمات روی [اخراج , اخطار , مسدود , حدف ]</code>
برای تعیین واکنش به تنظیمات قفل ها 
🔰<code>کمترین پیام کوتاه [ عدد ]</code>
برای تعیین کاراکتر برای پیام های کوتاه . اگر کمتر باشد پاک میشود پیامش !
🔰<code>تنظیم زمان رگباری [ عدد ]</code>
برای تنظیم زمان پیام رگباری که در آن بازه زمانی اگر بیشتر از عدد تعریف شده رگباری بدهد از گروه حذف میشود 
🔰<code>تنظیم لینک</code>
برای تنظیم لینک برای گروه در ربات
🔰<code>لینک</code>
برای گرفتن لینک گروه از ربات
🔰<code>تنظیمات</code>
برای دریافت تنظیمات گروه
🔰<code>حذف اخطار</code>
برای حذف اخطار های یک شخص یا کاربر
🔰<code>نمایش ویرایش</code>
برای نمایش پیام قبلیه ویرایش شده ! 
🔰<code>پنهان ویرایش</code>
برای نمایش ندادن پیام های ویرایش شده !
🔰<code>بپاک</code>
با ریپلی کردن به یه پیامی ربات اون پیام و پیام شمارو پاک میکند
🔰<code>نمایش تیک</code>
پیام ها محض فرستادن در گروه تیک خواهند خرد
🔰<code>پنهان تیک</code>
پیام ها تیک نخواهند خرد
🔰<code>تیک</code>
تیک خوردن پیام های قبلی
🔰<code>دسترسی برای [ مدیر , ناظم , همه ]</code>
دسترسی به دستورات عمومی مانند `من` برای مقام های مورد نظر
🔰<code>دستورات [ فارسی , انگلیسی ]</code>
برای تنظیم دستوراتربات به فارسی و یا انگلیسی
🔰<code>زبان [ فارسی , انگلیسی ]</code>
برای تنظیم زبان ربات برای پاسخ به دستورات
🔰<code>گزارش</code>
گزارش کردن پیام ریپلی شده به مدیر اصلی گروه توسط ربات
🔰<code>من</code>
دیدن اطلاعات خودتان
🔰<code>پاکسازی [ مدیر ها , فیلتر ها , ساکت ها , مسدود ها ]</code>
برای پاکسازی لیست هریک از موارد
🔰<code>ایدی</code>
برای دیدن ایدی خود یا ایدی ریپلی شده
🔰<code>تنظیم قوانین</code>
برای تنظیم متن به عنوان قوانین
🔰<code>قوانین</code>
برای دیدن قوانین
🔰<code>سنجاق</code>
برای سنجاق کردن پیام
🔰<code>حذف سنجاق</code>
برای حذف سناجق شده
🔰<code>راهنما</code>
برای دیدن این متن]] 
end
            else
help = [[Bot Commands Help :
🔸lock [shortmsg(Min Msgs character) ,flood(Fast Msgs), spam(A long Msg), link, tag( Msg Contains # ) , username ( Msg Contains @ ), forward , persian (Persian Characters) , english(English Characters), reply, fosh, edit(Msg Editing) ,location , caption (A text under Media), inline, emoji]
<b>Just Put the Word You Wanna be locked from [ ] words.</b> E.g :
lock tag
- - - - - - - - - - - - - -
🔸mute [all(Nothing Can be shared in Gp) , keyboard(Robots Keyboards), sticker , game(Telegram Api Games) , gif, contact, photo, audio, voice, video, document, text]
<b>Just Put the Word You Wanna be Muted from [ ] words.</b> E.g :
mute all
- - - - - - - - - - - - - -
🔸filter [Word]
<b>For Cleaning A word When Robot Finds it in a Members Sentence !</b> E.g :

filter Cat

🔸unfilter [Word]
<b>To Unfilter a Word !</b>
🔸filters
<b>To get Filtered Words List !</b>
- - - - - - - - - - - - - -
🔸setrules [Group Rules]
<b>To set A Sentence or Paragraph As Gp rules !</b>
setrules Please Be Polite !

🔸rules
<b>To Get Rules !</b>
- - - - - - - - - - - - - -
🔸promote [Username , ID , Reply]
<b>To Promote Some on as Moderator !</b> E.g :
promote 22122 or @MegaCreedBot
🔸modlist
<b>To Get Moderators List !</b>
- - - - - - - - - - - - - -
🔸settings
<b>To Get Settings !</b>
🔸id
<b>To Get Your and GPs ID !</b>
🔸me
<b>To Get Your Information and Messages</b>
- - - - - - - - - - - - - -
🔸setlang [en/fa]
<b>To set Your Groups language To Persian or English </b>
🔸lang
<b>To Get Your Groups Language </b>
- - - - - - - - - - - - - -
🔸setspam [Spam Msgs max Character 1-2000]
<b>To Clean Msgs That Have More Character than Value Set !</b> [ It can be Used only When <code>lock spam</code> is Enabled ] , E.G :
setspam 1500
- - - - - - - - - - - - - -
🔸setfloodtime [2-20]
<b>A Time to Check Flooded msgs from some on !</b> , E.G :
setfloodtime 3


🔸setfloodnum [5-30]
<b>To Set max Flooding Msgs number !</b> [ It can be Used only when <code>lock flood</code> is Enabled !], E.G :
setfloodnum 10
- - - - - - - - - - - - - -
🔸del
<b>To Delete Someones Msgs by Bot !</b>
- - - - - - - - - - - - - -
🔸kick [username / id ]
<b>Remove some one from Group !</b>
- - - - - - - - - - - - - -
🔸ban [username / id ]
<b>Ban Some one by Group !</b> [ He cant Return when he is banned ! ]
🔸unban [username / id]
<b>Unban Banned user !</b>
🔸banlist
<b>Banned Users list !</b>
- - - - - - - - - - - - - -
🔸muteuser [username / id]
<b>To mute Some one From talking !</b>
🔸unmuteuser [username / id]
<b>To Remove User from Mutelist !</b>
🔸mutelist
<b>To get Muted Users list !</b>
- - - - - - - - - - - - - -
🔸setname (اسم گروه)
<b>To Change Group name As u Want !</b>
🔸edit (متن)
<b>Reply to Bots Message And Write A message u want to Bot Edits his message to that !</b>
- - - - - - - - - - - - - -
🔸pin
<b>Pin A message You Reply by bot !</b>
🔸unpin
<b>Just Unping a Message by bot !</b>
- - - - - - - - - - - - - -
🔸clean [modlist/bots/banlist/mutelist]
<b>To Clean Moderators , Banned s , Muted Users , Bots list !</b>

Our Channel : @TearTeam
<code>Join to Learn News and Newest Commands !</code>


]]
            end
            sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:help') or help), 1, 'html')
          end
          if msg.content_.text_:match("^addadmin$") and is_sudo(msg) and msg.reply_to_message_id_ then
            function addadmin_reply(extra, result, success)
              local hash = 'botadmins:megacreed'
              if redis:sismember(hash, result.sender_user_id_) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = 'User : `'..result.sender_user_id_..'` *is Already in Admin list !*'
                else
                  text = 'کاربر : `'..result.sender_user_id_..'` *از قبل ادمين ربات هست !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                redis:sadd(hash, result.sender_user_id_)
                if redis:hget(msg.chat_id_ , 'lang:megacreed') == "en" then
                  text = 'User : `'..result.sender_user_id_..'` *Has been added as admin !*'
                else
                  text = 'کاربر : `'..result.sender_user_id_..'` *به ادمين هاي ربات اضافه شد !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              end
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,addadmin_reply)
          end
          if msg.content_.text_:match("^addadmin @(.*)$") and is_sudo(msg) then
            local match= {string.match(msg.content_.text_, "^(addadmin) @(.*)$")}
            function addadmin_by_username(extra, result, success)
              if result.id_ then
                redis:sadd('botadmins:megacreed', result.id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = 'User : <code>'..match[2]..'</code> <b>Has been Added to Admins !</b>'
                else
                  texts = 'کاربر : <code>'..match[2]..'</code> <b>به ادمين هاي ربات اضافه شد !</b>'
                end
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = '<code>Error 404 !</code>\n<b>User not found!</b>'
                else
                  texts = '<code>خطاي 404 !</code>\n<b>کاربر يافت نشد !</b>'
                end

              end
              sendmsg(chat_id, msg.id_, 0, 1, nil, texts, 1, 'html')
            end
            resolve_username(match[2],addadmin_by_username)
          end
          if msg.content_.text_:match("^addadmin (%d+)$") and is_sudo(msg) then
            local match = {string.match(msg.content_.text_, "^(addadmin) (%d+)$")}
            redis:sadd('botadmins:megacreed', match[2])
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              texts = 'User : <code>'..match[2]..'</code> <b>Has been Added to Admins !</b>'
            else
              texts = 'کاربر : <code>'..match[2]..'</code> <b>به ادمين هاي ربات اضافه شد !</b>'
            end
          end
          if msg.content_.text_:match("^remadmin$") and is_sudo(msg) and msg.reply_to_message_id_ then
            function remadmin_reply(extra, result, success)
              local hash = 'botadmins:megacreed'
              if not redis:sismember(hash, result.sender_user_id_) then
                sendmsg(chat_id, msg.id_, 0, 1, nil, 'User : `'..result.sender_user_id_..'` *Is not Admin !*', 1, 'md')
              else
                redis:srem(hash, result.sender_user_id_)
                sendmsg(chat_id, msg.id_, 0, 1, nil, 'User : `'..result.sender_user_id_..'` *Has been Added to Admins !*', 1, 'md')
              end
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,remadmin_reply)
          end
          -----------------------------------------------------------------------------------------------
          if msg.content_.text_:match("^remadmin @(.*)$") and is_sudo(msg) then
            local hash = 'botadmins:megacreed'
            local ap = {string.match(msg.content_.text_, "^(remadmin) @(.*)$")}
            function remadmin_by_username(extra, result, success)
              if result.id_ then
                redis:srem(hash, result.id_)
                texts = 'User : <code>'..result.id_..'</code> <b>Has been Removed From Admins list !</b>'
              else
                texts = '<code>Error 404 !</code>\n<b>User not found!</b>'
              end
              sendmsg(chat_id, msg.id_, 0, 1, nil, texts, 1, 'html')
            end
            resolve_username(ap[2],remadmin_by_username)
          end
          -----------------------------------------------------------------------------------------------
          if msg.content_.text_:match("^remadmin (%d+)$") and is_sudo(msg) then
            local hash = 'botadmins:megacreed'
            local ap = {string.match(msg.content_.text_, "^(remadmin) (%d+)$")}
            redis:srem(hash, ap[2])
            sendmsg(chat_id, msg.id_, 0, 1, nil, 'User : <code>'..ap[2]..'</code> <b>Has been Removed From Admins list !</b>', 1, 'html')
          end
          ----------------------------------------------------------------------------------------------__
          if msg.content_.text_:match('^([Aa]dminlist)') and is_admin(msg) then
            if redis:scard('botadmins:megacreed') == 0 then
              sendmsg(chat_id, 0, 0, 1, nil, '`Sorry Sir !`\n*There isnt any Admins Set for Bot !*', 1, 'md')
            else
              local text = "<b>Creed Bots Admins :</b> \n"
              for k,v in pairs(redis:smembers('botadmins:megacreed')) do
                text = text.."<b>"..k.."</b> <b>></b> "..get_info(v).."\n"
              end
              sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, text, 1, 'html')
            end
          end
          -----------------------------------------------------------------------
		  if ((msg.content_.text_:match("^[Ww]arn") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(اخطار)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) and msg.reply_to_message_id_ then
			function warn_reply(extra, result, success)
				if redis:sismember('promotes:megacreed'..result.chat_id_, result.sender_user_id_) then
					if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
						text = "*You Cannot Warn Moderators !*"
						else
						text = "شما نميتوانيد مدير هارا اخطار بدهيد !"
					end
				sendmsg(result.chat_id_, result.id_ ,0, 1, nil, text , 1, 'md')
				else
				redis:incr('warns:megacreed'..result.chat_id_..result.sender_user_id_)
				if tonumber(redis:get('warns:megacreed'..result.chat_id_..result.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..result.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..result.chat_id_) == "kick" then
						chat_kick(result.chat_id_, result.sender_user_id_)
						redis:incr('kicks:user:megacreed'..result.sender_user_id_)
						if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(result.sender_user_id_).." <b> Has been Kicked !</b>\n<code>His Warns Reached to Maximum Number !</code>"
							else
						text = "کاربر : \n"..get_info(result.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>تعداد اخطار های شخص به پایان رسیده بود  !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..result.chat_id_) == "ban" then
				chat_kick(result.chat_id_, result.sender_user_id_)
				redis:incr('kicks:user:megacreed'..result.sender_user_id_)
					if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(result.sender_user_id_).." <b> Has been Banned</b>\n<code>His Warns Reached to Maximum Number !</code>"
					else
						text = "کاربر : \n"..get_info(result.sender_user_id_).."\n <b> مسدود شد</b>\n<code>تعداد اخطار های شخص به پایان رسیده بود  !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..result.chat_id_, result.sender_user_id_)
				end
				redis:del('warns:megacreed'..result.chat_id_..result.sender_user_id_)
					else
				if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
						text = "*User Get Warn !*\n*His Warns : `"..(redis:get('warns:megacreed'..result.chat_id_..result.sender_user_id_) or "0").."`"
						else
						text = "کاربر اخطار گرفت  !\nتعداد اخطار هاي کاربر : `"..(redis:get('warns:megacreed'..result.chat_id_..result.sender_user_id_) or "0").."`"
					end
				sendmsg(result.chat_id_, result.id_ , 0 , 1 , nil , (redis:hget(msg.chat_id_ , 'answer:warn') or text), 1,  'md')
		    end
			end
			end
		tdcli.getMessage(chat_id,msg.reply_to_message_id_,warn_reply)
		end
		
		
		-----------------------------------------
		if ((msg.content_.text_:match("^[Ww]arn @(.*)") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(اخطار @)(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            local ap = {string.match(msg.content_.text_, "^([Ww]arn) @(.*)$")}
			local app = {string.match(msg.content_.text_, "^(اخطار @)(.*)$")}
            function warn_by_username(extra, result, success)
              if result.id_ then
				if redis:sismember('promotes:megacreed'..msg.chat_id_, result.id_) then
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "*You Cannot Warn Moderators !*"
						else
						text = "شما نميتوانيد مدير هارا اخطار بدهيد !"
					end
				sendmsg(msg.chat_id_, msg.id_ ,0, 1, nil, text , 1, 'md')
				else
                redis:incr('warns:megacreed'..msg.chat_id_..result.id_)
				if tonumber(redis:get('warns:megacreed'..msg.chat_id_..result.id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, result.id_)
						redis:incr('kicks:user:megacreed'..result.id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(result.id_).." <b> Has been Kicked !</b>\n<code>His Warns Reached to Maximum Number !</code>"
							else
						text = "کاربر : \n"..get_info(result.id_).." \n<b> اخراج شد</b>\n علت : <code>تعداد اخطار های شخص به پایان رسیده بود  !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, result.id_)
				redis:incr('kicks:user:megacreed'..result.id_)
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(result.id_).." <b> Has been Banned</b>\n<code>His Warns Reached to Maximum Number !</code>"
					else
						text = "کاربر : \n"..get_info(result.id_).."\n <b> مسدود شد</b>\n<code>تعداد اخطار های شخص به پایان رسیده بود  !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, result.id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..result.id_)
					else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = '<b>User :</b> @'..(ap[2] or app[2])..' ['..result.id_..'] <b>Has been Warned !</b>\nUser Warns : '..redis:get('warns:megacreed'..msg.chat_id_..result.id_)
                else
                  texts = '<b>کاربر :</b>\n @'..(ap[2] or app[2])..' ['..result.id_..']\n <b> اخطار گرفت !</b>\nتعداد اخطار های کاربر : '..redis:get('warns:megacreed'..msg.chat_id_..result.id_)
                end
              sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:warn') or texts), 1, 'html')
			  end
            end
			end
			end
			if msg.content_.text_:match("^[Ww]arn @(.*)") then
            resolve_username(ap[2],warn_by_username)
			else
			resolve_username(app[2],warn_by_username)
			end
			end
			

			if ((msg.content_.text_:match("^[Uu]nwarn @(.*)") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف اخطار @)(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            local ap = {string.match(msg.content_.text_, "^(unwarn) @(.*)$")}
			local app = {string.match(msg.content_.text_, "^(حذف اخطار @)(.*)$")}
            function unwarn_by_username(extra, result, success)
              if result.id_ then
                redis:del('warns:megacreed'..msg.chat_id_..result.id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = '<b>User :</b> @'..(ap[2] or app[2])..' ['..result.id_..'] <b>Warns Has been Removed !</b>\nUser Warns : '..(redis:get('warns:megacreed'..msg.chat_id_..result.id_) or 0 )
                else
                  texts = '<b>کاربر :</b>\n @'..(ap[2] or app[2])..' ['..result.id_..']\n <b> اخطار هایش پاک شد !</b>\nتعداد اخطار های کاربر : '..(redis:get('warns:megacreed'..msg.chat_id_..result.id_) or 0 )
                end
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = '<code>Error 404 !</code>\n<b>User Not Found !</b>'
                else
                  texts = '<code>خطاي 404 !</code>\n<b>کاربر يافت نشد !</b>'
                end
              end
              sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:unwarn') or texts), 1, 'html')
            end
            if msg.content_.text_:match("^[Uu]nwarn @(.*)") then
            resolve_username(ap[2],unwarn_by_username)
			else
			resolve_username(app[2],unwarn_by_username)
			end
			end
		  -----------------------------------------------------------------------

          if ((msg.content_.text_:match("^[Pp]romote$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(ارتقا)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) and msg.reply_to_message_id_ then
            tdcli.getMessage(chat_id,msg.reply_to_message_id_,setmod_reply,nil)
          end
          if ((msg.content_.text_:match("^[Dd]emote$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنزیل)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) and msg.reply_to_message_id_ then
            tdcli.getMessage(chat_id,msg.reply_to_message_id_,remmod_reply,nil)
          end

          if ((msg.content_.text_:match("^[Pp]romote @(.*)$")  and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(ارتقا @)(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
            local ap = {string.match(msg.content_.text_, "^(promote) @(.*)$")}
			local app = {string.match(msg.content_.text_, "^(ارتقا @)(.*)$")}
            function promote_by_username(extra, result, success)
              if result.id_ then
                redis:sadd('promotes:megacreed'..msg.chat_id_, result.id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = 'User : <code>'..result.id_..'</code> <b>Has Been Promoted !</b>'
                else
                  texts = 'کاربر : <code>'..result.id_..'</code> <b>ارتقا يافت !</b>'
                end
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = '<code>Error 404 !</code>\n<b>User Not Found !</b>'
                else
                  texts = '<code>خطاي 404 !</code>\n<b>کاربر يافت نشد !</b>'
                end
              end
              sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:promote') or texts), 1, 'html')
            end
            if msg.content_.text_:match("^[Pp]romote @(.*)") then
            resolve_username(ap[2],promote_by_username)
			else
			resolve_username(app[2],promote_by_username)
			end
          end
          -----------------------------------------------------------------------------------------------
          if ((msg.content_.text_:match("^[Pp]romote (%d+)$")  and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(ارتقا) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
            local hash = 'promotes:megacreed'..msg.chat_id_
            local ap = {string.match(msg.content_.text_, "^(promote) (%d+)$")}
			local app = {string.match(msg.content_.text_, "^(ارتقا) (%d+)$")}
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = 'User : <code>'..(ap[2] or app[2])..'</code> <b>Has been Promoted !</b>'
            else
              text = 'کاربر : <code>'..(ap[2] or app[2])..'</code> <b>ارتقا يافت !</b>'
            end
            redis:sadd(hash, ap[2])
            sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:promote') or text), 1, 'html')
          end
		  
		  
          if ((msg.content_.text_:match("^[Dd]emote @(.*)$")  and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنزیل @)(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
            local hash = 'promotes:megacreed'..msg.chat_id_
            local ap = {string.match(msg.content_.text_, "^(demote) @(.*)$")}
			local app = {string.match(msg.content_.text_, "^(تنزیل @)(.*)$")}
            function demote_by_username(extra, result, success)
              if result.id_ then
                redis:srem(hash, result.id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = 'User :<code>'..result.id_..'</code> <b>Has been Demoted !</b>'
                else
                  texts = 'کاربر :<code>'..result.id_..'</code> <b>عزل مقام شد !</b>'
                end
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = '<code>Error 404 !</code>\n<b>User Not Found !</b>'
                else
                  texts = '<code>خطاي 404 !</code>\n<b>کاربر يافت نشد !</b>'
                end
              end
              sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:demote') or texts), 1, 'html')
            end
            if msg.content_.text_:match("^[Dd]emote @(.*)") then
            resolve_username(ap[2],demote_by_username)
			else
			resolve_username(app[2],demote_by_username)
			end
          end
          -------------------------------------------------------------------------------------------------
          if ((msg.content_.text_:match("^[Dd]emote (%d+)$")  and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنزیل) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
            local hash = 'promotes:megacreed'..msg.chat_id_
            local ap = {string.match(msg.content_.text_, "^(demote) (%d+)$")}
			local app = {string.match(msg.content_.text_, "^(تنزیل) (%d+)$")}
            redis:srem(hash, ap[2])
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = 'User : <code>'..(ap[2] or app[2])..'</code> <b>Has been Demoted !</b>'
            else
              text = 'کاربر : <code>'..(ap[2] or app[2])..'</code> <b>عزل شد ! </b>'
            end
            sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:demote') or text), 1, 'html')
          end

          if ((msg.content_.text_:match("^[Mm]odlist$")  and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(لیست مدیر ها)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            if redis:scard('promotes:megacreed'..chat_id) == 0 then
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '*There is no Moderators !*'
              else
                text = '*مديري تعيين نشده است !*'
              end
              sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'md')
            else
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = "<b>Group Moderators List :</b> \n"
              else
                text = "<b>ليست مديران گروه :</b> \n"
              end
              for k,v in pairs(redis:smembers('promotes:megacreed'..chat_id)) do
                text = text.."<code>"..k.."</code> - "..get_info(v).."\n"
              end
              sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:modlist') or text), 1, 'html')
            end
          end
 if ((msg.content_.text_:match("^[Aa]llowlist$")  and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(لیست مجاز ها)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            if redis:scard('allows:megacreed'..chat_id) == 0 then
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '*There is no Allowed Users in This Group !*'
              else
                text = '*هیچ شخصی در این گروه مجاز به ارسال محتوای غیر مجاز نمیباشد*'
              end
              sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'md')
            else
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = "<b>Group Allowed Users LIST :</b> \n"
              else
                text = "<b>لیست افراد مجاز :</b> \n"
              end
              for k,v in pairs(redis:smembers('allows:megacreed'..chat_id)) do
                text = text.."<code>"..k.."</code> - "..get_info(v).."\n"
              end
              sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:allowlist') or text), 1, 'html')
            end
          end
          -----------------------------------------------------------------------------------------------------------------------------

          if ((msg.content_.text_:match("^[Ss]etowner$")  and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^تنظیم سازنده$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_admin(msg) and msg.reply_to_message_id_ then
            tdcli.getMessage(chat_id,msg.reply_to_message_id_,setowner_reply,nil)
          end


          if ((msg.content_.text_:match("^[Oo]wner$")  and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^سازنده$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) then
            local hash = 'owners:megacreed'..chat_id
            local owner = redis:get(hash)
            if owner == nil then
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '*There is not Owner in this group !*'
              else
                text = '*براي اين گروه مديري تعيين نشده است !*'
              end
              sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'md')
            end
            local owner_list = redis:get('owners:megacreed'..chat_id)
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text85 = '🔸<b>Group Owner :</b>\n\n '..get_info(owner_list)
            else
              text85 = '🔸<b>مدير گروه :</b>\n\n '..get_info(owner_list)
            end
            sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:owner') or text85), 1, 'html')
          end

          if ((msg.content_.text_:match("^([Ss]etowner) (.*)$") and not msg.content_.text_:match("^([Ss]etowner) (@)") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیم سازنده) (.*)$") and not msg.content_.text_:match("^(تنظیم سازنده) (@)") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))and is_owner(msg) then
				ap2 = {string.match(msg.content_.text_, "^([Ss]etowner) (.*)$")}
				ap3 = {string.match(msg.content_.text_, "^(تنظیم سازنده) (.*)$")}
				user = (ap2[2] or ap3[2])
				RDSC = redis:get('owners:megacreed'..msg.chat_id_)
				if RDSC then
					redis:srem('owner_gps:megacreed'..RDSC,msg.chat_id_)
					redis:set('owners:megacreed'..msg.chat_id_,user)
					redis:sadd('owner_gps:megacreed'..user,msg.chat_id_)
				else
					redis:set('owners:megacreed'..msg.chat_id_,user)
					redis:sadd('owner_gps:megacreed'..user,msg.chat_id_)
				end
				if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = 'User : <code>'..ap2[2]..'</code> <b>Has Been Promoted as Owner !</b>'
                else
                  texts = 'کاربر : <code>'..ap2[2]..'</code> <b>به عنوان مدير گروه ارتقا يافت !</b>'
                end
				sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:setowner') or texts), 1, 'html')
			end
			
          if ((msg.content_.text_:match("^[Ss]etowner @(.*)$")  and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیم سازنده) @(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_admin(msg) then
            local matches = {string.match(msg.content_.text_, "^([Ss]etowner) @(.*)$")}
			local matchees = {string.match(msg.content_.text_, "^(تنظیم سازنده) @(.*)$")}
            function setowner_username(extra, result, success)
              if result.id_ then
			  	RDSC = redis:get('owners:megacreed'..msg.chat_id_)
				if RDSC then
				redis:srem('owner_gps:megacreed'..RDSC,msg.chat_id_)
				redis:set('owners:megacreed'..msg.chat_id_,result.id_)
                redis:sadd('owner_gps:megacreed'..result.id_,msg.chat_id_)
				else
				redis:set('owners:megacreed'..msg.chat_id_,result.id_)
                redis:sadd('owner_gps:megacreed'..result.id_,msg.chat_id_)
				end
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = 'User : @'..(matches[2] or matchees[2])..' [<code>'..result.id_..'</code>] <b>Has Been Promoted as Owner !</b>'
                else
                  texts = 'کاربر : \n@'..(matches[2] or matchees[2])..' [<code>'..result.id_..'</code>]\n <b>به عنوان مدير گروه ارتقا يافت !</b>'
                end
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = '<code>Error 404 !</code>\n<b>User Not Found !</b>'
                else
                  texts = '<code>خطاي 404 !</code>\n<b>يافت نشد !</b>'
                end
              end
              sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:setowner') or texts), 1, 'html')
            end
			if msg.content_.text_:match("^[Ss]etowner @(.*)$") then
            resolve_username(matches[2], setowner_username)
			else
			resolve_username(matchees[2], setowner_username)
			end
          end




         
          -----------------------------------------------------------------------------------------------------------------------


          if ((msg.content_.text_:match("^[Kk]ick") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(اخراج)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = msg.reply_to_message_id_}, kick_reply, 'md')
            return
          end

          if ((msg.content_.text_:match("^[Kk]ick (%d+)") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(اخراج) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and not input:find('@') and is_mod(msg) then
			local matches = {string.match(msg.content_.text_ , "^(kick) (%d+)")}
			local matchees = {string.match(msg.content_.text_ , "^(اخراج)(%d+)$")}
            if redis:sismember('promotes:megacreed'..msg.chat_id_ ,(matches[2] or matchees[2])) or redis:sismember('botadmins:megacreed' , (matches[2] or matchees[2])) then
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '*You Can,t Kick Moderators !*'
              else
                text = '*شما نميتوانيد مدير و ناظم هارا حذف کنيد !*'
              end
              sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:kick') or text), 1, 'md')
            else
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = 'User : '..get_info((matches[2] or matchees[2]))..' <b>Has been Kicked !</b>'
              else
                text = 'کاربر : \n'..get_info((matches[2] or matchees[2]))..'\n حذف شد !'
              end
              sendmsg(chat_id, 0, 0, 1, nil,  (redis:hget(msg.chat_id_ , 'answer:kick') or text), 1, 'html')
			  if msg.content_.text_:match("^[Kk]ick (%d+)") then
              tdcli.changeChatMemberStatus(chat_id, matches[2], 'Kicked')
			  else 
			  tdcli.changeChatMemberStatus(chat_id, matchees[2], 'Kicked') 
			  end 
            end
          end
          if ((msg.content_.text_:match("^[Kk]ick @(.*)") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(اخراج @)(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
              function kick_by_username(arg, data)
			  local matches = {string.match(msg.content_.text_ , "^(kick) @(.*)")}
			  local matchees = {string.match(msg.content_.text_ , "^(اخراج @)(.*)$")}
			  if redis:sismember('promotes:megacreed'..msg.chat_id_ ,(matches[2] or matchees[2])) or redis:sismember('botadmins:megacreed' , (matches[2] or matchees[2])) then
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '*You Can,t Kick Moderators !*'
              else
                text = '*شما نميتوانيد مدير و ناظم هارا حذف کنيد !*'
              end
              sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'md')
            else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = 'User : '..(matches[2] or matchees[2])..' <b>Has been Kicked !</b>'
                else
                  text = 'کاربر : '..(matches[2] or matchees[2])..' حذف شد !'
                end
                sendmsg(chat_id, 0, 0, 1, nil,  (redis:hget(chat_id , 'answer:kick') or text), 1, 'html')
                tdcli.changeChatMemberStatus(chat_id, data.id_, 'Kicked')
              end
            end
			if msg.content_.text_:match("^[Kk]ick @(.*)") then
		   resolve_username(matches[2],kick_by_username)
		   else
		   resolve_username(matchees[2],kick_by_username)
		   end
          end
		  ------------------------------------------------------
		  if ((msg.content_.text_:match("^([Aa]llow) @(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(مجاز) @(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then 
            local ap = {string.match(msg.content_.text_, "^([Aa]llow) @(.*)$")}
			local app = {string.match(msg.content_.text_, "^(مجاز) @(.*)$")}
            function allow_by_username(extra, result, success)	
			if result.id_ then
                  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                    texts = 'User : '..get_info(result.id_)..' <b>Has been Added to allow list !</b>'
                  else
                    texts = 'کاربر : \n'..get_info(result.id_)..'\n <b>به لیست مجوز دار ها اضافه شد !</b>'
                  end
                  redis:sadd('allows:megacreed'..msg.chat_id_ , result.id_)
            else 
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = '<code>User not found!</code>'
                else
                  texts = '<code>کاربر يافت نشد !</code>'
                end
				end
	         sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:allow') or texts), 1, 'html')
			end
			if msg.content_.text_:match("^([Aa]llow) @(.*)$") then
            resolve_username(ap[2],allow_by_username)
			else
			resolve_username(app[2],allow_by_username)
			end
          end
		  --------------------------------------------------------
		  if ((msg.content_.text_:match("^([Aa]llow)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(مجاز)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) and msg.reply_to_message_id_ then 
            function allow_by_reply(extra, result, success)	
                  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                    texts = 'User : '..get_info(result.sender_user_id_)..' <b>Has been Added to allow list !</b>'
                  else
                    texts = 'کاربر : \n'..get_info(result.sender_user_id_)..'\n <b>به لیست مجوز دار ها اضافه شد !</b>'
                  end
                  redis:sadd('allows:megacreed'..msg.chat_id_ , result.sender_user_id_)
	         sendmsg(msg.chat_id_, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:allow') or texts), 1, 'html')
			end
		tdcli.getMessage(msg.chat_id_, msg.reply_to_message_id_, allow_by_reply)
          end
		  --------------------------------------------------------
		  if ((msg.content_.text_:match("^([Dd]is[Aa]llow) @(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(غیرمجاز) @(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then 
            local ap = {string.match(msg.content_.text_, "^([Dd]is[Aa]llow) @(.*)$")}
			local app = {string.match(msg.content_.text_, "^(غیرمجاز) @(.*)$")}
            function disallow_by_username(extra, result, success)	
			if result.id_ then
                  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                    texts = 'User : '..get_info(result.id_)..' <b>Has been Removed From Allow list !</b>'
                  else
                    texts = 'کاربر : \n'..get_info(result.id_)..'\n <b>از لیست مجاز ها حذف شد !</b>'
                  end
                  redis:srem('allows:megacreed'..msg.chat_id_ , result.id_)
            else 
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = '<code>User not found!</code>'
                else
                  texts = '<code>کاربر يافت نشد !</code>'
                end
				end
	         sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:disallow') or texts), 1, 'html')
			end
			if msg.content_.text_:match("^([Dd]is[Aa]llow) @(.*)$") then
            resolve_username(ap[2],disallow_by_username)
			else
			resolve_username(app[2],disallow_by_username)
			end
          end
		  --------------------------------------------------------
		  if ((msg.content_.text_:match("^([Dd]is[Aa]llow)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(غیرمجاز)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) and msg.reply_to_message_id_ then 
            function disallow_by_reply(extra, result, success)	
                  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                    texts = 'User : '..get_info(result.sender_user_id_)..' <b>Has been Removed From Allow list !</b>'
                  else
                    texts = 'کاربر : \n'..get_info(result.sender_user_id_)..'\n <b>از لیست مجاز ها حذف شد !</b>'
                  end
                  redis:srem('allows:megacreed'..msg.chat_id_ , result.sender_user_id_)
	         sendmsg(msg.chat_id_, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:disallow') or texts), 1, 'html')
			end
		tdcli.getMessage(msg.chat_id_, msg.reply_to_message_id_, disallow_by_reply)
          end
          --------------------------------------------------------
          if ((msg.content_.text_:match("^[Bb]an") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(مسدود)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) and msg.reply_to_message_id_ then
            function ban_by_reply(extra, result, success)
              local hash = 'bot:banned:megacreed'..msg.chat_id_
			      if redis:sismember('promotes:megacreed'..result.chat_id_, result.sender_user_id_) or redis:sismember('botadmins:megacreed' , result.sender_user_id_) or (redis:get('owners:megacreed'..chat_id) == result.sender_user_id_) then
				  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*You Cannot Ban Moderators !*'
                else
                  text = 'شما نميتوانيد مدير ها را مسدود بکنيد !'
                end
				  sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'md')
				  else
              if redis:sismember(hash, result.sender_user_id_) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = 'User : '..get_info(result.sender_user_id_)..'  is Already Banned !'
                else
                  text = 'کاربر : \n'..get_info(result.sender_user_id_)..'\n از قبل مسدود بود !'
                end
                sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
                chat_kick(result.chat_id_, result.sender_user_id_)
				redis:incr('kicks:user:megacreed'..result.sender_user_id_)
              else
                redis:sadd(hash, result.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = 'User : '..get_info(result.sender_user_id_)..' Has been Banned ! '
                else
                  text = 'کاربر : \n'..get_info(result.sender_user_id_)..' \nاز گروه مسدود شد ! '
                end
                sendmsg(chat_id, 0, 0, 1, nil,  (redis:hget(msg.chat_id_ , 'answer:ban') or text), 1, 'html')
                chat_kick(result.chat_id_, result.sender_user_id_)
				redis:incr('kicks:user:megacreed'..result.sender_user_id_)
				end
              end
            end
            tdcli.getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
          end
          -----------------------------------------------------------------------------------------------
          if msg.content_.text_:match("^[Bb]anall$") and is_sudo(msg) and msg.reply_to_message_id_ then
            function banall_by_reply(extra, result, success)
		if redis:sismember('botadmins:megacreed', result.id_) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*You Can,t Banall [ Admins / Sudo ] !*'
                else
                  text = '*شما نميتوانيد سازنده ربات و ادمين ها را مسدود کنيد !*'
                end
                sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'md')
              end
              local hash = 'bot:gbanned:megacreed'
              if redis:sismember(hash, result.id_) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = 'User : `'..result.id_..'` *is Already Globally Banned !*'
                else
                  text = 'کاربر : `'..result.id_..'` *از قبل مسدود همگاني بود !*'
                end
                sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'md')
                chat_kick(result.chat_id_, result.id_)
				redis:incr('kicks:user:megacreed'..result.id_)
              else
                redis:sadd(hash, result.id_)

                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = 'User : `'..result.id_..'` *Has been Globally Banned !*'
                else
                  text = 'کاربر : `'..result.id_..'` *از گروه مسدود همگاني شد !*'
                end
                sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'md')
                chat_kick(result.chat_id_, result.id_)
				redis:incr('kicks:user:megacreed'..result.id_)
              end
            end
            tdcli.getMessage(msg.chat_id_, msg.reply_to_message_id_,banall_by_reply)
          end
          -----------------------------------------------------------------------------------------------
          if ((msg.content_.text_:match("^[Bb]an @(.*)") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(مسدود @)(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            local ap = {string.match(msg.content_.text_, "^(ban) @(.*)$")}
			local app = {string.match(msg.content_.text_, "^(مسدود) @(.*)$")}
            function ban_by_username(extra, result, success)	
			if result.id_ then
			if redis:sismember('promotes:megacreed'..msg.chat_id_, result.id_) or redis:sismember('botadmins:megacreed' , result.id_) or (redis:get('owners:megacreed'..msg.chat_id_) == result.id_) then
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                     text = '*You Can,t Ban Moderators !*'
                   else
                     text = '*شما نميتوانيد مدير و ناظم هارا مسدود کنيد !*'
                   end
			 		sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'md')
			else
	        redis:sadd('bot:banned:megacreed'..msg.chat_id_, result.id_)
                  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                    texts = 'User : '..get_info(result.id_)..' <b>Has been Banned !</b>'
                  else
                    texts = 'کاربر : \n'..get_info(result.id_)..'\n <b>مسدود شد !</b>'
                  end
                  chat_kick(msg.chat_id_, result.id_)
				  redis:incr('kicks:user:megacreed'..result.id_)
				  redis:incr('bans:user:megacreed'..result.id_)
	end
            else 
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = '<code>User not found!</code>'
                else
                  texts = '<code>کاربر يافت نشد !</code>'
                end
    end
	         sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:ban') or texts), 1, 'html')
    end
	if msg.content_.text_:match("^[Bb]an @(.*)") then
            resolve_username(ap[2],ban_by_username)
			else
			resolve_username(app[2],ban_by_username)
			end
          end
          -----------------------------------------------------------------------------------------------
          if msg.content_.text_:match("^banall @(.*)$") and is_sudo(msg) then
            local ap = {string.match(msg.content_.text_, "^(banall) @(.*)$")}
            function banall_by_username(extra, result, success)
              if result.id_ then
                if redis:sismember('botadmins:megacreed', result.id_) then
                  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                    text = '*You Can,t Banall [ Admins / Sudo ] !*'
                  else
                    text = '*شما نميتوانيد سازنده ربات و ادمين ها را بن کنيد !*'
                  end
                  sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'md')
                end
                if not redis:sismember('bot:gbanned:megacreed', result.id_) then
                  redis:sadd('bot:gbanned:megacreed', result.id_)
                  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                    texts = '<b>User :</b> '..get_info(result.id_)..' <b>Has been Globally Banned !</b>'
                  else
                    texts = 'کاربر : \n'..get_info(result.id_)..' \n<b>بن همگاني شد !</b>'
                  end
                  chat_kick(msg.chat_id_, result.id_)
				  redis:incr('kicks:user:megacreed'..result.id_)
				  redis:incr('bans:user:megacreed'..result.id_)
                end
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = '<code>User not found!</code>'
                else
                  texts = '<code>کاربر يافت نشد !</code>'
                end
              end
              sendmsg(chat_id, 0, 0, 1, nil, texts, 1, 'html')
            end
            resolve_username(ap[2],banall_by_username)
          end
          -----------------------------------------------------------------------------------------------
          if msg.content_.text_:match("^[Bb]an (%d+)$") and is_mod(msg) then
            local ap = {string.match(msg.content_.text_, "^(ban) (%d+)$")}
			if (redis:sismember('promotes:megacreed'..msg.chat_id_, ap[2]) or redis:sismember('botadmins:megacreed' , ap[2])) then
         if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '*You Can,t [Kick/Ban] Moderators !*'
              else
                text = '*شما نميتوانيد مدير و ناظم ها را بن کنيد !*'
              end
              sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'md')
    else
	        redis:sadd('bot:banned:megacreed'..msg.chat_id_, ap[2])
              chat_kick(msg.chat_id_, ap[2])
			  redis:incr('bans:user:megacreed'..ap[2])
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = 'User : '..ap[2]..' <b> Has been Banned !</b>'
              else
                text = 'کاربر : '..ap[2]..' <b> بن شد !</b>'
              end
              sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:ban') or text), 1, 'html')
	end
          end
          -----------------------------------------------------------------------------------------------
          if msg.content_.text_:match("^banall (%d+)$") and is_sudo(msg) then
            local ap = {string.match(msg.content_.text_, "^(banall) (%d+)$")}
            if not redis:sismember("botadmins:", ap[2]) or sudo_users == result.sender_user_id_ then
		redis:sadd('bot:gbanned:megacreed', ap[2])
              chat_kick(msg.chat_id_, ap[2])
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '<b>User :</b> <code>'..ap[2]..'</code> <b> Has been Globally Banned !</b>'
              else
                text = 'کاربر : <code>'..ap[2]..'</code> <b> بن همگاني شد !</b>'
              end
              sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')	
            else
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '*You Can,t Banall [Admins / Sudo ] !*'
              else
                text = '*شما نميتوانيد سازنده ربات و ادمين ها را بن کنيد !*'
              end
              sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'md')
            end
          end
          -----------------------------------------------------------------------------------------------
          if ((msg.content_.text_:match("^[Uu]nban") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف مسدودیت)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) and msg.reply_to_message_id_ then
            function unban_by_reply(extra, result, success)
              local hash = 'bot:banned:megacreed'..msg.chat_id_
              if not redis:sismember(hash, result.sender_user_id_) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = 'User : '..result.sender_user_id_..' <b>is Not Banned !</b>'
                else
                  text = 'کاربر : '..result.sender_user_id_..' <b>بن نبود !</b>'
                end
                sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
              else
                redis:srem(hash, result.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = 'User : '..result.sender_user_id_..' <b>Has been Unbanned !</b>'
                else
                  text = 'کاربر : '..result.sender_user_id_..' <b>آنبن شد !</b>'
                end
                sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
              end
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
          end

          -----------------------------------------------------------------------------------------------
          if msg.content_.text_:match("^[Uu]nbanall$") and is_sudo(msg) and msg.reply_to_message_id_ then
            function unbanall_by_reply(extra, result, success)
              local hash = 'bot:gbanned:megacreed'
              if not redis:sismember(hash, result.sender_user_id_) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>User :</b> '..get_info(result.sender_user_id_)..' <b>is Not Globally Banned !</b>'
                else
                  text = 'کاربر : \n'..get_info(result.sender_user_id_)..' \n<b>بن نبود !</b>'
                end
                sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
              else
                redis:srem(hash, result.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>User :</b> '..get_info(result.sender_user_id_)..' <b>Has been Globally Unbanned !</b>'
                else
                  text = 'کاربر : \n'..get_info(result.sender_user_id_)..' \n<b>آنبن شد !</b>'
                end
                sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
              end
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,unbanall_by_reply)
          end
          -----------------------------------------------------------------------------------------------
          if ((msg.content_.text_:match("^[Uu]nban @(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف مسدودیت @)(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            local ap = {string.match(msg.content_.text_, "^(unban) @(.*)$")}
			local app = {string.match(msg.content_.text_, "^(حذف مسدودیت @)(.*)$")}
            function unban_by_username(extra, result, success)
              if result.id_ then
                redis:srem('bot:banned:megacreed'..msg.chat_id_, result.id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>User :</b> '..get_info(result.id_)..' <b>Has been Unbanned !</b>'
                else
                  text = '<b>کاربر :</b> \n'..get_info(result.id_)..' \n<b> آنبن شد !</b>'
                end
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<code>Error 404 !</code>\n<b>User not found!</b>'
                else
                  text = '<code>خطاي 404  !</code>\n<b>کاربر يافت نشد !</b>'
                end
              end
              sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:unban') or text), 1, 'html')
            end
			if msg.content_.text_:match("^[Uu]nban @(.*)$") then
            resolve_username(ap[2],unban_by_username)
			else 
			resolve_username(app[2],unban_by_username) 
			end 
          end

          --------------------------------------------------------------------------------------------
          if msg.content_.text_:match("^[Uu]nbanall @(.*)$") and is_sudo(msg) then
            local ap = {string.match(msg.content_.text_, "^(unbanall) @(.*)$")}
            function unbanall_by_username(extra, result, success)
              if result.id_ then
                redis:srem('bot:gbanned:megacreed', result.id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>User :</b> @'..ap[2]..' [ <code>'..result.id_..'</code> ] <b>Has been Globally Unbanned !</b>'
                else
                  text = '<b>کاربر :</b> \n@'..ap[2]..' [ <code>'..result.id_..'</code> ] \n<b> آنبن همگاني شد !</b>'
                end
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<code>Error 404 !</code>\n<b>User not found!</b>'
                else
                  text = '<code>خطاي 404  !</code>\n<b>کاربر يافت نشد !</b>'
                end
              end
              sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
            end
            resolve_username(ap[2],unbanall_by_username)
          end
          -----------------------------------------------------------------------------------------------
          if ((msg.content_.text_:match("^([Uu]nban) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف مسدودیت) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            local ap = {string.match(msg.content_.text_, "^([Uu]nban) (%d+)$")}
			local app = {string.match(msg.content_.text_, "^(حذف مسدودیت) (%d+)$")}
            redis:srem('bot:banned:megacreed'..msg.chat_id_, ap[2])
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = 'User : '..get_info(ap[2])..' <b>Has been Unbanned !</b>'
            else
              text = 'کاربر : \n'..get_info(ap[2])..'\n <b>آنبن شد !</b>'
            end
            sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:unban') or text), 1, 'html')
          end
          ---------------------------------------------------------
          if msg.content_.text_:match("^[Uu]nbanall (%d+)$") and is_sudo(msg) then
            local ap = {string.match(msg.content_.text_, "^([Uu]nbanall) (%d+)$")}
	     if not redis:hget('bot:gbanned:megacreed', ap[2]) then
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = '<b>User :</b> '..get_info(ap[2])..' <b>Is not Globally banned !</b>'
            else
              text = 'کاربر : \n'..get_info(ap[2])..' \n<b>بن همگاني نبود !</b>'
            end
	    else

            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = '<b>User :</b> '..get_info(ap[2])..' <b>Has been Globally Unbanned !</b>'
            else
              text = 'کاربر : \n'..get_info(ap[2])..' \n<b>آنبن همگاني شد !</b>'
            end
		            redis:srem('bot:gbanned:megacreed', ap[2])
	    end
	            sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
          end
          ----------------------------------------------------------
          if ((msg.content_.text_:match("^([Bb]anlist)") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(لیست مسدود ها)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            local hash =  'bot:banned:megacreed'..msg.chat_id_
            local list = redis:smembers(hash)
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = "<b>Ban List:</b>\n\n"
            else
              text = "<b>ليست مسدود شده ها :</b>\n\n"
            end
            for k,v in pairs(list) do
              local user_info = redis:hgetall('user:'..v)
              if user_info and user_info.username then
                local username = user_info.username
                text = text..k.." - @"..username.." ["..v.."]\n"
              else
                text = text..k.." - "..v.."\n"
              end
            end
            if #list == 0 then
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = "<code>Error 404 !</code>\n<b>Ban List is empty !</b>"
              else
                text = "<code>خطاي 404 !</code>\n<b>ليست مسدود خاليست !</b>"
              end
            end
            sendmsg(chat_id, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:banlist') or text), 1, 'html')
          end

          ---------------------------------------------------------
          if msg.content_.text_:match("^gbanlist$") and is_admin(msg) then
            local hash =  'bot:gbanned:megacreed'
            local list = redis:smembers(hash)
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = "<b>Global Ban List:</b>\n\n"
            else
              text = "<b>ليست بن شده هاي همگاني :</b>\n\n"
            end
            for k,v in pairs(list) do
              local user_info = redis:hgetall('user:'..v)
              if user_info and user_info.username then
                local username = user_info.username
                text = text..k.." - @"..username.." ["..v.."]\n"
              else
                text = text..k.." - "..v.."\n"
              end
            end
            if #list == 0 then
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = "<code>Error 404 !</code>\n<b>Ban List is empty !</b>"
              else
                text = "<code>خطاي 404 !</code>\n<b>ليست بن هاي همگاني خاليست !</b>"
              end
            end
            sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
          end
          ----------------------------------------------------------

          if ((msg.content_.text_:match("^([Mm]uteuser)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(ساکت)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            redis:set('mute_user:megacreed'..chat_id,'yes')
            tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = msg.reply_to_message_id_}, setmute_reply, 'md')
          end
          if ((msg.content_.text_:match("^([Uu]nmuteuser)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف ساکت)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = msg.reply_to_message_id_}, demute_reply, 'md')
          end
          if ((msg.content_.text_:match("^([Mm]uteuser) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(ساکت) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
		    local ap = {string.match(msg.chat_id_, "^([Mm]uteuser) (%d+)$")}
			local app = {string.match(msg.chat_id_, "^(ساکت) (%d+)$")}
			if redis:sismember('promotes:megacreed'..msg.chat_id_, (ap[2] or app[2])) or redis:sismember("botadmins:", (ap[2] or app[2])) or (redis:get('owners:megacreed'..msg.chat_id_) ==  (ap[2] or app[2])) then
			if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = '<b>You Cannot Mute Admins/Owners/Mods/sudo Users !</b>'
            else
              text = 'شما نمیتوانید مدیر/سازنده ربات/ادمین ربات/مدیر اصلی را ساکت بکنید !'
            end
            sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
			else
            redis:sadd('muteusers:megacreed'..chat_id,(ap[2] or app[2]))
            redis:set('mute_user:megacreed'..chat_id,'yes')
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = 'User : '..(get_info((ap[2] or app[2])) or (ap[2] or app[2]) )..' <b>Has been Added to mutelist</b>'
            else
              text = 'کاربر : \n'..(get_info((ap[2] or app[2])) or (ap[2] or app[2]) )..'\n <b>ساکت شد !</b>\nوضعيت : <code>قادر به حرف زدن نميباشد !</code>'
            end
            sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
          end
		  end
		  if ((msg.content_.text_:match("^([Uu]nmuteuser) @(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف ساکت @)(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            local ap = {string.match(msg.content_.text_, "^([Uu]nmuteuser) @(.*)$")}
			local app = {string.match(msg.content_.text_, "^(حذف ساکت @)(.*)$")}
            function unmute_by_username(extra, result, success)
              if result.id_ then
                redis:srem('muteusers:megacreed'..msg.chat_id_, result.id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Successfull !</b>\nUser : '..get_info(result.id_)..' <b>Has been Unmuted !</b>\nStatus : <code>He Can Speak Now !</code>'
                else
                  text = 'تراکنش موفق !\n<b>کاربر :</b> \n'..get_info(result.id_)..'\n <b> قادر به حرف زدن ميباشد!</b>'
                end
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<code>Error 404 !</code>\n<b>User not found!</b>'
                else
                  text = '<code>خطاي 404  !</code>\n<b>کاربر يافت نشد !</b>'
                end
              end
              sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
            end
			if msg.content_.text_:match("^([Uu]nmuteuser) @(.*)$") then
            resolve_username(ap[2],unmute_by_username)
			else
			resolve_username(app[2],unmute_by_username)
			end
          end
		  
          if ((msg.content_.text_:match("^([Uu]nmuteuser) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف ساکت) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
            local ap = {string.match(msg.content_.text_, "^([Uu]nmuteuser) (%d+)$")}
			local app = {string.match(msg.content_.text_, "^(حذف ساکت) (%d+)$")}
            redis:srem('muteusers:megacreed'..msg.chat_id_, (ap[2] or app[2]))
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = 'User : '..get_info((ap[2] or app[2]))..' <b>Has been Unmuted !</b>'
            else
              text = 'کاربر : \n'..get_info((ap[2] or app[2]))..'\n <b>از ساکتي خارج شد !</b>'
            end
            sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
          end
		  
		  
           if ((msg.content_.text_:match("^([Mm]uteuser) @(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(ساکت @)(.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_sudo(msg) then
            local ap = {string.match(msg.content_.text_, "^(muteuser) @(.*)$")}
			local app = {string.match(msg.content_.text_, "^(ساکت @)(.*)$")}
            function mute_by_username(extra, result, success)
              if result.id_ then
			  if redis:sismember('promotes:megacreed'..msg.chat_id_, result.id_) or redis:sismember("botadmins:", result.id_) or (redis:get('owners:megacreed'..msg.chat_id_) ==  result.id_) then
			if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = '<b>You Cannot Mute Admins/Owners/Mods/sudo Users !</b>'
            else
              text = 'شما نمیتوانید مدیر/سازنده ربات/ادمین ربات/مدیر اصلی را ساکت بکنید !'
            end
            sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
			else
                if redis:sismember('muteusers:megacreed'..chat_id, result.id_) then
                  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                    text = '*You Can,t Mute Moderators !*'
                  else
                    text = '*شما نميتوانيد سازنده ربات و ادمين ها را ساکت کنيد !*'
                  end
                  sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'md')
                end
                if not redis:sismember('muteusers:megacreed'..chat_id, result.id_) then
                  redis:sadd('muteusers:megacreed'..chat_id, result.id_)
	              redis:set('mute_user:megacreed'..chat_id,'yes')
                  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                    texts = '<b>User :</b> '..get_info(result.id_)..' <b>Has been Added To Mutelist !</b>'
                  else
                    texts = 'کاربر : \n'..get_info(result.id_)..' \n<b>ساکت شد !</b>'
                  end
                end
				end
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  texts = '<code>User not found!</code>'
                else
                  texts = '<code>کاربر يافت نشد !</code>'
                end
              end
              sendmsg(chat_id, 0, 0, 1, nil, texts, 1, 'html')
            end
			if msg.content_.text_:match("^([Mm]uteuser) @(.*)$") then
            resolve_username(ap[2],mute_by_username)
			else 
			resolve_username(app[2],mute_by_username)
			end
          end
          if ((msg.content_.text_:match("^[Mm]utelist$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(لیست ساکت)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) then
            if redis:scard('muteusers:megacreed'..chat_id) == 0 then
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '*There is not Muted Users in This Group !*'
              else
                text = '*هيچ شخص ساکت شده اي وجود ندارد !*'
              end
              return sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'md')
            end
            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              text = "<b>Muted Users List :</b>\n"
            else
              text = "<b>ليست اعضاي ساکت شده :</b>\n"
            end
            for k,v in pairs(redis:smembers('muteusers:megacreed'..chat_id)) do
              text = text.."<code>"..k.."</code>> <b>"..v.."</b>\n"
            end
            return sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
          end
          ---------------------------------------------------------------------------------------------

          if msg.content_.text_:find('^https://(.*)') or msg.content_.text_:find('^http://(.*)') and not is_mod(msg) then
            if redis:get('mute_weblink:megacreed'..msg.sender_user_id_) then
              tdcli.deleteMessages(msg.chat_id_, {[0] = msg.reply_to_message_id_})
            else return end
            end
			if msg.content_.text_:match("^dlmsg (%d+)$") and is_mod(msg) then
			tdcli.deleteMessagesFromUser(msg.chat_id_, msg.sender_user_id_)
			end
            ----------------------------------------------------------------------------------------------
			if ((msg.content_.text_:match("^[Ss]etpassword (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیم رمز) (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
			local matches = {string.match(msg.content_.text_, "^([Ss]etpassword) (.*)$")}
			local matchees = {string.match(msg.content_.text_, "^(تنظیم رمز) (.*)$")}
			redis:set('groups:password'..msg.sender_user_id_, (matches[2] or matchees[2]))
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "<b>Your Password Has been set Successfully !</b>"
					else
						text = "<b>رمز شما به درستی تنظيم شد !</b>\n"
					end
					sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				end

            --Filtering--
			if ((msg.content_.text_:match("^[Ss]etanswer (.*) (.*)") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیم جواب) (.*) (.*)") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
			local matches = {string.match(msg.content_.text_, "^([Ss]etanswer) (.*) (.*)")}
			local matchees = {string.match(msg.content_.text_, "^(تنظیم جواب) (.*) (.*)")}
				if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
					text = "<b>Your Text for Command : "..(matches[3] or matchees[3]).." Has been Successfully Set !</b>"
				  else
					text = "<b>پیام شما برای دستور : "..(matches[3] or matchees[3]).." با موفقیت تنظیم شد !</b>"
				end
					sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
					if msg.content_.text_:match("^[Ss]etanswer (.*) (.*)") then
						redis:hset(msg.chat_id_, 'answer:'..matches[3] , matches[2])
					  else 
						redis:hset(msg.chat_id_, 'answer:'..matchees[3] , matchees[2])
					end
			end
			
			if ((msg.content_.text_:match("^[Rr]emanswer (.*)") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف جواب) (.*)") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
			local matches = {string.match(msg.content_.text_, "^([Rr]emanswer) (.*)")}
			local matchees = {string.match(msg.content_.text_, "^(حذف جواب) (.*)")}
				if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
					text = "<b>Your Text for Command : "..(matches[2] or matchees[2]).." Has been Removed !</b>"
				  else
					text = "<b>پیام شما برای دستور : "..(matches[2] or matchees[2]).." حذف شد !</b>"
				end
					sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
					if msg.content_.text_:match("^[Rr]emanswer (.*)") then
						redis:hdel(msg.chat_id_, 'answer:'..matches[2])
					  else 
						redis:hdel(msg.chat_id_, 'answer:'..matchees[2])
					end
			end
            -----------------------------------------------------------------------------------------------
            if ((msg.content_.text_:match("^[Ff]ilter (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(فیلتر) (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
			  local ap = {string.match(msg.content_.text_, "^(filter) (.*)$")}
			  local app = {string.match(msg.content_.text_, "^(فیلتر) (.*)$")}
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
			 text = '<b>Word :</b> <code>'..(ap[2] or app[2])..'</code> <b>Has been Added to Filtered Words !</b>'
              else
                text = '<b>کلمه ي :</b> <code>'..(ap[2] or app[2])..'</code> <b>به ليست کلمات فيلتر شده اضافه شد !</b>'
              end
              sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:filter') or text), 1, 'html')
              redis:sadd('filters:megacreed'..msg.chat_id_, (ap[2] or app[2]))
            end
            if ((msg.content_.text_:match("^[Uu]n[Ff]ilter (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف فیلتر) (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
			  local ap = { string.match(msg.content_.text_, "^(unfilter) (.*)$")}
			  local app = { string.match(msg.content_.text_, "^(حذف فیلتر) (.*)$")}
			if not redis:sismember('filters:megacreed'..msg.chat_id_, (ap[2] or app[2])) then
			  if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '<b>Word :</b> <code>'..(ap[2] or app[2])..'</code> <b>Is not Filtered !</b>'
              else
                text = '<b>کلمه ي :</b> <code>'..(ap[2] or app[2])..'</code> <b>فیلتر نبود !</b>'
              end
              sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, text, 1, 'html')
			  else
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '<b>Word :</b> <code>'..(ap[2] or app[2])..'</code> <b>Has been Removed From Filtered Words !</b>'
              else
                text = '<b>کلمه ي :</b> <code>'..(ap[2] or app[2])..'</code> <b>از ليست کلمات فيلتر شده حذف شد !</b>'
              end
              sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:unfilter') or text), 1, 'html')
              redis:srem('filters:megacreed'..msg.chat_id_, (ap[2] or app[2]))
			  end
            end

            if ((msg.content_.text_:match("^[Ff]ilters$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(لیست فیلتر ها)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
              local flist = redis:smembers('filters:megacreed'..msg.chat_id_)
              if flist == 0 then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Filter List is Empty !*'
                else
                  text = '*ليست کلمات فيلتر شده خالي ميباشد !*'
                end
                sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, text, 1 , "md")
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Filtered Words List :*\n\n'
                else
                  text = '*ليست کلمات فيلتر شده :*\n\n'
                end
                for k,v in pairs(flist) do
                  text = text..">*"..k.."*- `"..v.."`\n"
                end
                sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:filters') or text), 1 , "md")
              end
            end


            -------------------------------------------------------
            -------------------------------------------------------









            --*		*		*
            -------------------------------
            -------------Locks-------------
            -------------------------------

            --*		*		*












            ---------------------------------------------------------------
            --lock bots
            
            
            if ((msg.content_.text_:match("^[Ll]ock bots$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل ربات)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_bots:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Bots protection Status Was :</b> <code>Locked</code> \n<b>Removing Bots Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_bots'))..''
                else
                  text = '<b>وضعيت قبلي ربات :</b> <code>قفل</code> \n<b>قفل ربات از قبل فعال شده بود توسط :</b>\n'..get_info(redis:hget(chat_id, 'locker_bots'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_bots:megacreed' , true)
                redis:hset(chat_id , 'locker_bots' , msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Bots protection Status :</b> <code>Locked</code> \n<b>Bots Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت ربات :</b> <code>قفل</code> \n<b>ربات ها قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:bots') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock bots$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی ربات)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_bots:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>Bots protection Status Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي ربات :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_bots' , msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_bots:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Bots protection Status :</b> <code>UnLock</code>\n<b>Removing Bots is Disabled !</b>'
                else
                  text = '<b>وضعيت ربات :</b> <code>باز</code>\n<b>قفل ربات غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end

            --lock links
            
            if ((msg.content_.text_:match("^[Ll]ock links$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل لینک)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_links:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Links Status Was :</b> <code>Locked</code> \n<b>Cleaning Links Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_links'))..''
                else
                  text = '<b>وضعيت قبلي لينک :</b> <code>قفل</code> \n<b>قفل لينک از قبل فعال شده بود توسط :</b>\n'..get_info(redis:hget(chat_id, 'locker_links'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_links:megacreed' , true)
                redis:hset(chat_id , 'locker_links' , msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Links Status :</b> <code>Locked</code> \n<b>Links Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت لينک :</b> <code>قفل</code> \n<b>لينک ها قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:links') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock links$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی لینک)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_links:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Links Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي لينک :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_links' , msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_links:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Links Status :</b> <code>UnLock</code>\n<b>Links Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت لينک :</b> <code>باز</code>\n<b>قفل لينک غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end
			--lock mention
            
            if ((msg.content_.text_:match("^[Ll]ock mention$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل فراخوانی)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_mention:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Mention Status Was :</b> <code>Locked</code> \n<b>Cleaning Mentions Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_mention'))..''
                else
                  text = '<b>وضعيت قبلي فراخواني :</b> <code>قفل</code> \n<b>قفل فراخواني از قبل فعال شده بود  :</b>\n'..get_info(redis:hget(chat_id, 'locker_mention'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_mention:megacreed' , true)
                redis:hset(chat_id , 'locker_mention' , msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Mentions Status :</b> <code>Locked</code> \n<b>Mentions Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت فراخواني :</b> <code>قفل</code> \n<b>فراخواني ها قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:mention') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock mention$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی فراخوانی)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_mention:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>Mentions Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي فراخواني :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_mention' , msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_mention:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Mentions Status :</b> <code>UnLock</code>\n<b>Mentions Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت فراخواني :</b> <code>باز</code>\n<b>قفل فراخواني غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end
            --lock username
            if ((msg.content_.text_:match("^[Ll]ock username$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل یوزرنیم)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_username:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Username Status Was :</b> <code>Locked</code> \n<b>Cleaning Username Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_username'))..''
                else
                  text = '<b>وضعيت قبلي يوزرنيم :</b> <code>قفل</code> \n<b>قفل يوزرنيم از قبل فعال شده بود توسط :</b>\n'..get_info(redis:hget(chat_id, 'locker_username'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_username:megacreed' , true)
                redis:hset(chat_id , 'locker_username' , msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Username Status :</b> <code>Locked</code> \n<b>Username Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت يوزرنيم :</b> <code>قفل</code> \n<b>يوزرنيم ها قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:username') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock username$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی یوزرنیم)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_username:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Username Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي يوزرنيم :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_username' , msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_username:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Username Status :</b> <code>UnLock</code>\n<b>Username Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت يوزرنيم :</b> <code>باز</code>\n<b>قفل يوزرنيم غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end

            --lock tag
            if ((msg.content_.text_:match("^[Ll]ock tag$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل تگ)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_tag:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Tag Status Was :</b> <code>Locked</code> \n<b>Cleaning Tag Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_tag'))..''
                else
                  text = '<b>وضعيت قبلي تگ :</b> <code>قفل</code> \n<b>قفل تگ از قبل فعال شده بود توسط :</b>\n'..get_info(redis:hget(chat_id, 'locker_tag'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_reply:megacreed' , true)
                redis:hset(chat_id , 'locker_tag' , msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Tag Status :</b> <code>Locked</code> \n<b>Tag Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت تگ :</b> <code>قفل</code> \n<b>تگ ها قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:tag') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[uU]nlock tag$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی تگ)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_tag:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Tag Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي تگ :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_tag', msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_tag:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Tag Status :</b> <code>UnLock</code>\n<b>Tag Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت تگ :</b> <code>باز</code>\n<b>قفل تگ غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end
            
            --arabic/persian
            if ((msg.content_.text_:match("^[Ll]ock persian$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل فارسی)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_persian:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Persian/Arabic Status Was :</b> <code>Locked</code> \n<b>Cleaning Persian/Arabic Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_persian'))..''
                else
                  text = '<b>وضعيت قبلي حروف فارسي :</b> <code>قفل</code> \n<b>قفل حروف فارسي از قبل فعال شده بود توسط :</b>\n'..get_info(redis:hget(chat_id, 'locker_persian'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_persian:megacreed', true)
                redis:hset(chat_id , 'locker_persian' , msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Persian/Arabic Status :</b> <code>Locked</code> \n<b>Persian/Arabic Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت حروف فارسي :</b> <code>قفل</code> \n<b>حروف فارسي قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:persian') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock persian$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی فارسی)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_persian:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Persian/Arabic Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي حروف فارسي :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_persian' , msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_persian:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Persian/Arabic Status :</b> <code>UnLock</code>\n<b>Persian/Arabic Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت حروف فارسي :</b> <code>باز</code>\n<b>قفل حروف فارسي غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end
            ---forward
            if ((msg.content_.text_:match("^[Ll]ock forward$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل فوروارد)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_forward:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Forward Status Was :</b> <code>Locked</code> \n<b>Cleaning Forward Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_forward'))..''
                else
                  text = '<b>وضعيت قبلي فوروارد :</b> <code>قفل</code> \n<b>قفل فوروارد از قبل فعال شده بود توسط :</b>\n'..get_info(redis:hget(chat_id, 'locker_forward'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_forward:megacreed' , true)
                redis:hset(chat_id , 'locker_forward' , msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Forward Status :</b> <code>Locked</code> \n<b>Forward Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت فوروارد :</b> <code>قفل</code> \n<b>فوروارد قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:forward') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock forward$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی فوروارد)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_forward:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Forward Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي فوروارد :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_forward' , msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_forward:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Forward Status :</b> <code>UnLock</code>\n<b>Forward Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت فوروارد :</b> <code>باز</code>\n<b>قفل فوروارد غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end
            --lock fosh
            if ((msg.content_.text_:match("^[Ll]ock fosh$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل فحش)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_fosh:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Fosh Status Was :</b> <code>Locked</code> \n<b>Cleaning Fosh Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_fosh'))..''
                else
                  text = '<b>وضعيت قبلي فحش :</b> <code>قفل</code> \n<b>قفل فحش از قبل فعال شده بود توسط :</b>\n'..get_info(redis:hget(chat_id, 'locker_fosh'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_fosh:megacreed' , true)
                redis:hset(chat_id , 'locker_fosh' , msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Fosh Status :</b> <code>Locked</code> \n<b>Fosh Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت فحش :</b> <code>قفل</code> \n<b>فحش قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:fosh') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock fosh$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی فحش)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_fosh:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Fosh Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي فحش :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_fosh' , msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_fosh:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Fosh Status :</b> <code>UnLock</code>\n<b>Fosh Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت فحش :</b> <code>باز</code>\n<b>قفل فحش غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end

            --lock location
            if ((msg.content_.text_:match("^[Ll]ock location$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل مکان)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_location:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Location Status Was :</b> <code>Locked</code> \n<b>Cleaning Location Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_location'))..''
                else
                  text = '<b>وضعيت قبلي اشتراک مکان :</b> <code>قفل</code> \n<b>قفل اشتراک مکان از قبل فعال شده بود توسط :</b>\n'..get_info(redis:hget(chat_id, 'locker_location'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_location:megacreed', true) 
                redis:hset(chat_id , 'locker_location' , msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Location Status :</b> <code>Locked</code> \n<b>Location Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت اشتراک مکان :</b> <code>قفل</code> \n<b>اشتراک مکان قفل شد توسط :</b> \n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:location') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock location$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی مکان)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_location:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Location Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي اشتراک مکان :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_location' , msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_location:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Location Status :</b> <code>UnLock</code>\n<b>Location Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت اشتراک مکان :</b> <code>باز</code>\n<b>قفل اشتراک مکان غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end

            --lock edit
            if ((msg.content_.text_:match("^[Ll]ock edit$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل ویرایش)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_edit:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Edit Status Was :</b> <code>Locked</code> \n<b>Cleaning Edit Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_edit'))..''
                else
                  text = '<b>وضعيت قبلي ويرايش :</b> <code>قفل</code> \n<b>قفل ويرايش از قبل فعال شده بود توسط :</b> \n'..get_info(redis:hget(chat_id, 'locker_edit'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_edit:megacreed', true)
                redis:hset(chat_id , 'locker_edit' , msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Edit Status :</b> <code>Locked</code> \n<b>Edit Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت ويرايش :</b> <code>قفل</code> \n<b>ويرايش قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:edit') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock edit$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی ویرایش)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_edit:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Edit Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي ويرايش :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_edit' , msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_edit:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Edit Status :</b> <code>UnLock</code>\n<b>Edit Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت ويرايش :</b> <code>باز</code>\n<b>قفل ويرايش غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end
            --- lock Caption
            if ((msg.content_.text_:match("^[Ll]ock caption$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل زیرنویس)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_caption:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Caption Status Was :</b> <code>Locked</code> \n<b>Cleaning Caption Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_caption'))..''
                else
                  text = '<b>وضعيت قبلي زير نويس :</b> <code>قفل</code> \n<b>قفل زير نويس از قبل فعال شده بود توسط :</b>\n'..get_info(redis:hget(chat_id, 'locker_caption'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_caption:megacreed', true)
                redis:hset(chat_id , 'locker_caption' , msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Caption Status :</b> <code>Locked</code> \n<b>Caption Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت زير نويس :</b> <code>قفل</code> \n<b>زير نويس قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:caption') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock caption$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی زیرنویس)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_caption:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Caption Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي زير نويس :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_caption' , msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_caption:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Caption Status :</b> <code>UnLock</code>\n<b>Caption Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت زير نويس :</b> <code>باز</code>\n<b>قفل زير نويس غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end
            --lock emoji
            if ((msg.content_.text_:match("^[Ll]ock emoji$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل شکلک)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_emoji:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Emoji Status Was :</b> <code>Locked</code> \n<b>Cleaning Emoji Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_emoji'))..''
                else
                  text = '<b>وضعيت قبلي شکلک ها :</b> <code>قفل</code> \n<b>قفل شکلک ها از قبل فعال شده بود توسط :</b> \n'..get_info(redis:hget(chat_id, 'locker_emoji'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_emoji:megacreed', msg.sender_user_id_)
                redis:hset(chat_id , 'locker_emoji', msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Emoji Status :</b> <code>Locked</code> \n<b>Emoji Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت شکلک ها :</b> <code>قفل</code> \n<b>شکلک ها قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:emoji') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock emoji$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی شکلک)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_emoji:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Emoji Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي شکلک ها :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_emoji', msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_emoji:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Emoji Status :</b> <code>UnLock</code>\n<b>Emoji Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت شکلک ها :</b> <code>باز</code>\n<b>قفل شکلک ها غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end
            --- lock inline
            if ((msg.content_.text_:match("^[Ll]ock inline$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل اینلاین)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_inline:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Inline Status Was :</b> <code>Locked</code> \n<b>Cleaning Inline Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_inline'))..''
                else
                  text = '<b>وضعيت قبلي اينلاين :</b> <code>قفل</code> \n<b>قفل اينلاين از قبل فعال شده بود توسط :</b> \n'..get_info(redis:hget(chat_id, 'locker_inline'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_inline:megacreed', true)
                redis:hset(chat_id , 'locker_inline' , msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Inline Status :</b> <code>Locked</code> \n<b>Inline Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت اينلاين :</b> <code>قفل</code> \n<b>اينلاين قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:inline') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock inline$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی اینلاین)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_inline:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Inline Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي اينلاين :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
			    redis:hset(chat_id , 'unlocker_inline', msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_inline:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Inline Status :</b> <code>UnLock</code>\n<b>Inline Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت اينلاين :</b> <code>باز</code>\n<b>قفل اينلاين غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end


            -- lock english

            if ((msg.content_.text_:match("^[Ll]ock english$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل انگلیسی)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_english:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>English Status Was :</b> <code>Locked</code> \n<b>Cleaning English Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_english'))..''
                else
                  text = '<b>وضعيت قبلي حروف انگليسي :</b> <code>قفل</code> \n<b>قفل حروف انگليسي از قبل فعال شده بود توسط :</b> \n'..get_info(redis:hget(chat_id, 'locker_english'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_english:megacreed', true)
                redis:hset(chat_id , 'locker_english', msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>English Status :</b> <code>Locked</code> \n<b>English Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت حروف انگليسي :</b> <code>قفل</code> \n<b>حروف انگليسي قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:english') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock english$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی انگلیسی)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_english:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌English Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي حروف انگليسي :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_english', msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_english:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>English Status :</b> <code>UnLock</code>\n<b>English Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت حروف انگليسي :</b> <code>باز</code>\n<b>قفل حروف انگليسي غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end

            -- lock reply
            if ((msg.content_.text_:match("^[Ll]ock reply$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل پاسخ)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_reply:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Reply Status Was :</b> <code>Locked</code> \n<b>Cleaning Reply Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_reply'))..''
                else
                  text = '<b>وضعيت قبلي پاسخ به پيام :</b> <code>قفل</code> \n<b>قفل پاسخ به پيام از قبل فعال شده بود توسط :</b> \n'..get_info(redis:hget(chat_id, 'locker_reply'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_reply:megacreed' , true)
                redis:hset(chat_id , 'locker_reply', msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Reply Status :</b> <code>Locked</code> \n<b>Reply Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت پاسخ به پيام :</b> <code>قفل</code> \n<b>پاسخ به پيام قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:reply') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock reply$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی پاسخ)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_reply:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Reply Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي پاسخ به پيام :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_reply', msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_reply:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Reply Status :</b> <code>UnLock</code>\n<b>Reply Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت پاسخ به پيام :</b> <code>باز</code>\n<b>قفل پاسخ به پيام غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end

            --lock spam
            if ((msg.content_.text_:match("^[Ll]ock spam$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل پیام طولانی)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_spam:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Spam Status Was :</b> <code>Locked</code> \n<b>Cleaning Spam Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_spam'))..''
                else
                  text = '<b>وضعيت قبلي پيام طولاني :</b> <code>قفل</code> \n<b>قفل پيام طولاني از قبل فعال شده بود توسط :</b> \n'..get_info(redis:hget(chat_id, 'locker_spam'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_spam:megacreed', true)
                redis:hset(chat_id , 'locker_spam', msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Spam Status :</b> <code>Locked</code> \n<b>Spam Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت پيام طولاني :</b> <code>قفل</code> \n<b>پيام طولاني قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:spam') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock spam$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی پیام طولانی)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_spam:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Spam Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي پيام طولاني :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_spam', msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_spam:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Spam Status :</b> <code>UnLock</code>\n<b>Spam Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت پيام طولاني :</b> <code>باز</code>\n<b>قفل پيام طولاني غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end

	     -- shortmsg message lock
			if ((msg.content_.text_:match("^[Ll]ock shortmsg$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل پیام کوتاه)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_shortmsg:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>shortmsg Messages Status Was :</b> <code>Locked</code> \n<b>Cleaning Spam Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_shortmsg'))..''
                else
                  text = '<b>وضعيت قبلي پيام کوتاه :</b> <code>قفل</code> \n<b>قفل پيام کوتاه از قبل فعال شده بود توسط :</b> \n'..get_info(redis:hget(chat_id, 'locker_shortmsg'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_shortmsg:megacreed', true)
                redis:hset(chat_id , 'locker_shortmsg', msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Short Messages Status :</b> <code>Locked</code> \n<b>Short Messages Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت پيام کوتاه :</b> <code>قفل</code> \n<b>پيام کوتاه قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:shortmsg') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock shortmsg$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی پیام کوتاه)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_shortmsg:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Short Messages Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي پيام کوتاه :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_shortmsg', msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_shortmsg:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Short Messages Status :</b> <code>UnLock</code>\n<b>Short Messages Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت پيام کوتاه :</b> <code>باز</code>\n<b>قفل پيام کوتاه غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end

            -- flood lock
            if ((msg.content_.text_:match("^[Ll]ock flood$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل رگباری)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(chat_id , 'lock_flood:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Flood Status Was :</b> <code>Locked</code> \n<b>Cleaning Flood Are Already Locked by :</b> '..get_info(redis:hget(chat_id, 'locker_flood'))..''
                else
                  text = '<b>وضعيت قبلي پيام رگباري :</b> <code>قفل</code> \n<b>قفل پيام رگباري از قبل فعال شده بود توسط :</b> \n'..get_info(redis:hget(chat_id, 'locker_flood'))..''
                end
                return sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'lock_flood:megacreed', true)
                redis:hset(chat_id , 'locker_flood', msg.sender_user_id_)
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Flood Status :</b> <code>Locked</code> \n<b>Flood Has been Locked by :</b> '..get_info(msg.sender_user_id_)..''
                else
                  text = '<b>وضعيت پيام رگباري :</b> <code>قفل</code> \n<b>پيام رگباري قفل شد توسط :</b>\n'..get_info(msg.sender_user_id_)..''
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:flood') or text), 1, 'html')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nlock flood$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(رهایی رگباری)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa"))  and is_mod(msg)  then
              if not redis:hget(chat_id , 'lock_flood:megacreed') then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text ='<b>‌Flood Cleaning Was on :</b> <code>UnLock</code>\n<b>Status Not Changed !</b>'
                else
                  text = '<b>وضعيت قبلي پيام رگباري :</b> <code>باز</code>\n<b>وضعيت تغيير نکرد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                redis:hset(chat_id , 'unlocker_flood', msg.sender_user_id_)
                redis:hdel(chat_id , 'lock_flood:megacreed')
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Flood Status :</b> <code>UnLock</code>\n<b>Flood Cleaning is Disabled !</b>'
                else
                  text = '<b>وضعيت پيام رگباري :</b> <code>باز</code>\n<b>قفل پيام رگباري غير فعال شد !</b>'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              end
            end
           if ((msg.content_.text_:match("^[Ss]etfloodnum (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیم پیام رگباری) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
              local floodmax = {string.match(msg.content_.text_, "^(setfloodnum) (%d+)$")}
			  local flooodmax = {string.match(msg.content_.text_, "^(تنظیم پیام رگباری) (%d+)$")}
              if (tonumber((floodmax[2]) or (flooodmax[2])) < 2 or tonumber((floodmax[2]) or (flooodmax[2])) > 30) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Wrong number*\n _range is  [2-30]_ '
                else
                  text = '*عدد اشتباه است !*\n _محدوده ی عدد برای تعیین : [ 2-30 ]_'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                redis:set('floodnum:megacreed'..msg.chat_id_,(floodmax[2]) or (flooodmax[2]))
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*> Flood Number has been set to* : `[ '..((floodmax[2]) or (flooodmax[2]))..' ]`'
                else
                  text = '*> تعداد حساسيت به پيام رگباري تنظيم شد به * : `[ '..((floodmax[2]) or (flooodmax[2]))..' ]`'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:setfloodnum') or text), 1, 'md')
              end
            end
			-----------------------------------------------------------------------------------------------
			if ((msg.content_.text_:match("^[Ww]elcome (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(خوشامد گویی) (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
				local ap = {string.match(msg.content_.text_, "^([Ww]elcome) (.*)$")}
				local app = {string.match(msg.content_.text_, "^(خوشامد گویی) (.*)$")}
				if (ap[2] == 'enable' or app[2] == 'فعال') then
					redis:set('welcome:gp:megacreed'..msg.chat_id_, true)
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = '*Welcome Has been Enabled !*\nRobot Will be Greeting New Members !'
					else
						text = '*خوشامد گویی فعال شد !*\nبه اعضای جدید گروه خوش آمد گفته خواهد شد !'
					end
					sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
				end
				if (ap[2] == 'disable' or app[2] == 'غیر فعال') then
					redis:del('welcome:gp:megacreed'..msg.chat_id_, true)
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = '*Welcome Has been Disabled !*\nRobot Wont be Greeting New Members !'
					else
						text = '*خوشامد گویی غیر فعال شد !*\nبه اعضای جدید دیگر خوش آمد گفته نخواهد شد !'
					end
					sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:welcome') or text), 1, 'md')
				end
			end
			-----------------------------------------------------------------------------------------------
			if ((msg.content_.text_:match("^[Ss]etwelcome (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیم خوشامد گویی) (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
				local ap = {string.match(msg.content_.text_, "^([Ss]etwelcome) (.*)$")}
				local app = {string.match(msg.content_.text_, "^(تنظیم خوشامد گویی) (.*)$")}
				redis:set('welcome:msg:megacreed'..msg.chat_id_ , (ap[2] or app[2]))
				if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Welcome Has been Set to* :\n'..(ap[2] or app[2])
                else
                  text = '*خوشامد گویی تنظیم شد به* :\n'..(ap[2] or app[2])
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:setwelcome') or text), 1, 'md')
				end
            -----------------------------------------------------------------------------------------------
            if ((msg.content_.text_:match("^[Ss]etspam (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیم پیام طولانی) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
              local maxspam = {string.match(msg.content_.text_, "^(setspam) (%d+)$")}
			  local maxsspam = {string.match(msg.content_.text_, "^(تنظیم پیام طولانی) (%d+)$")}
              if tonumber((maxspam[2] or maxsspam[2])) < 20 or tonumber((maxspam[2] or maxsspam[2])) > 2000 then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Error !*\n*Wrong Number of Value !*\n*Should be between *`[20-2000]` *!*'
                else
                  text = '*خطا !*\n*مقدار تعيين شده اشتباه ميباشد !*\n*ميبايست بين *`[20-2000]` *باشد !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil,text , 1, 'md')
              else
                redis:set('maxspam:megacreed'..msg.chat_id_,(maxspam[2] or maxsspam[2]))
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*> Spam Characters has been set to* : `['..(maxspam[2] or maxsspam[2])..']`'
                else
                  text = '*> ميزان حد مجازي پيام طولاني تنظيم شد به* : `['..(maxspam[2] or maxsspam[2])..']`'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:setspam') or text), 1, 'md')
              end
            end
			
			
			-----------------------------------------------------------
			if ((msg.content_.text_:match("^[Ss]etwarn (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیم اخطار به) (.*)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
              local setwarn = {string.match(msg.content_.text_, "^(setwarn) (.*)$")}
			  local setwwarn = {string.match(msg.content_.text_, "^(تنظیم اخطار به) (.*)$")}
				if ((setwarn[2] == "kick" and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (setwwarn[2] == "اخراج" and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) then
				redis:set('setwarn:megacreed'..msg.chat_id_, "kick")
				if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Warn Action Has been Set to :* `Kick` '
                else
                  text = 'واکنش به اخطار تنظيم شد به : `اخراج`'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
				end
				if ((setwarn[2] == "ban" and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (setwwarn[2] == "مسدود" and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) then
				redis:set('setwarn:megacreed'..msg.chat_id_, "ban")
				if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Warn Action Has been Set to :* `Ban` '
                else
                  text = 'واکنش به اخطار تنظيم شد به : `بن ( مسدود )`'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:setwarn') or text), 1, 'md')
		    	end
			end
			------------------------------------------------------------
			if ((msg.content_.text_:match("^[Ww]arnmax (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(نهایت اخطار) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
			local warnmax = {string.match(msg.content_.text_, "^(warnmax) (%d+)$")}
			local warnmmax = {string.match(msg.content_.text_, "^(نهایت اخطار) (%d+)$")}
			redis:set('warnmax:megacreed'..msg.chat_id_, (warnmax[2] or warnmmax[2]))
			if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Warn Max Number Has been Set to :* [ `'..(warnmax[2] or warnmmax[2])..'` ] '
                else
                  text = 'حداکثر مقدار اخطار تنظيم شد به : [ `'..(warnmax[2] or warnmmax[2])..'` ]'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:warnmax') or text), 1, 'md')
			end
			------------------------------------------------------------
			if ((msg.content_.text_:match("^[Ss]etlock kick$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیمات روی اخراج)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
			   redis:set('setlock:megacreed'..msg.chat_id_, "kick")
			   if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
			      text = "*Done !*\nLock Action Changed to : `Kick`"
				  else
				  text = "تراکنش موفق !\nرخداده قفل ها تغيير کرد به : اخراج"
			   end
			   sendmsg(msg.chat_id_, msg.id_, 0, 1, nil , (redis:hget(msg.chat_id_ , 'answer:setlock') or text) , 1 ,"md")
			end
			if ((msg.content_.text_:match("^[Ss]etlock warn$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیمات روی اخطار)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
			   redis:set('setlock:megacreed'..msg.chat_id_, "warn")
			   if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
			      text = "*Done !*\nLock Action Changed to : `Warn`"
				  else
				  text = "تراکنش موفق !\nرخداده قفل ها تغيير کرد به : اخطار"
			   end
			   sendmsg(msg.chat_id_, msg.id_, 0, 1, nil , (redis:hget(msg.chat_id_ , 'answer:setlock') or text) , 1 ,"md")
			end
			if ((msg.content_.text_:match("^[Ss]etlock del$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیمات روی حذف)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
			   redis:set('setlock:megacreed'..msg.chat_id_, "del")
			   if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
			      text = "*Done !*\nLock Action Changed to : `Delete`"
				  else
				  text = "تراکنش موفق !\nرخداده قفل ها تغيير کرد به : حذف"
			   end
			   sendmsg(msg.chat_id_, msg.id_, 0, 1, nil , (redis:hget(msg.chat_id_ , 'answer:setlock') or text) , 1 ,"md")
			end
			if ((msg.content_.text_:match("^[Ss]etlock ban$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیمات روی مسدود)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
			   redis:set('setlock:megacreed'..msg.chat_id_, "ban")
			   if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
			      text = "*Done !*\nLock Action Changed to : `Ban`"
				  else
				  text = "تراکنش موفق !\nرخداده قفل ها تغيير کرد به : بن"
			   end
			   sendmsg(msg.chat_id_, msg.id_, 0, 1, nil , (redis:hget(msg.chat_id_ , 'answer:setlock') or text) , 1 ,"md")
			end

-----------------------------------------------------------------------------------------------
            if ((msg.content_.text_:match("^[Ss]etshortmsg (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(کمترین پیام کوتاه) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
              local shortmsg = {string.match(msg.content_.text_, "^(setshortmsg) (%d+)$")}
			  local shorttmsg = {string.match(msg.content_.text_, "^(کمترین پیام کوتاه) (%d+)$")}
              if tonumber((shortmsg[2] or shorttmsg[2])) < 2 or tonumber((shortmsg[2] or shorttmsg[2])) > 40 then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Error !*\n*Wrong Number of Value !*\n*Should be between *`[2-40]` *!*'
                else
                  text = '*خطا !*\n*مقدار تعيين شده اشتباه ميباشد !*\n*ميبايست بين *`[2-40]` *باشد !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil,text , 1, 'md')
              else
                redis:set('shortmsgmax:megacreed'..msg.chat_id_,(shortmsg[2] or shorttmsg[2]))
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*> Short Messages Characters has been set to* : `['..(shortmsg[2] or shorttmsg[2])..']`'
                else
                  text = '*> ميزان حد مجازي پيام کوتاه تنظيم شد به* : `['..(shortmsg[2] or shorttmsg[2])..']`'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:setshortmsg') or text), 1, 'md')
              end
            end
            -----------------------------------------------------------------------------------------------
            if ((msg.content_.text_:match("^[Ss]etfloodtime (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیم زمان رگباری) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
              local floodt = {string.match(msg.content_.text_, "^(setfloodtime) (%d+)$")}
			  local floodtt = {string.match(msg.content_.text_, "^(تنظیم زمان رگباری) (%d+)$")}
              if tonumber((floodt[2] or floodtt[2])) < 2 or tonumber((floodt[2] or floodtt[2])) > 999 then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Error !*\n*Wrong Number of Value !*\n*Should be between *`[2-999]` *!*'
                else
                  text = '*خطا !*\n*مقدار تعيين شده اشتباه ميباشد !*\n*ميبايست بين *`[2-999]` *باشد !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil,text , 1, 'md')
              else
                redis:set('floodtime:megacreed'..msg.chat_id_,(floodt[2] or floodtt[2]))
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*> Flood Time has been set to* : `['..(floodt[2] or floodtt[2])..']`'
                else
                  text = '*> زمان پيام رگباري تنظيم شد به* : `['..(floodt[2] or floodtt[2])..']`'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:setfloodtime') or text), 1, 'md')
              end
            end
            -----------------------------------------------------------------------------------------------
            if ((msg.content_.text_:match("^[Ss]etlink$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تنظیم لینک)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = '*Please Send Group Link Now!*'
              else
                text = '*لطفا لينک گروه را ارسال کنيد !*'
              end
              sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:setlink') or text), 1, 'md')
              redis:set("bot:group:link"..msg.chat_id_, 'Link Set Status : `Waiting !`')
            end
            -----------------------------------------------------------------------------------------------
            if ((msg.content_.text_:match("^[Ll]ink$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(لینک)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) then
              local link = redis:get("bot:group:link"..msg.chat_id_)
              if link then
                sendmsg(chat_id, msg.id_, 0, 1, nil, '<b>Group link:</b>\n'..link, 1, 'html')
              else
                sendmsg(chat_id, msg.id_, 0, 1, nil, '*There is not Any Links Seted Yet !*\n*Please Set your Link by* `setlink` *Command !*', 1, 'md')
              end
            end


            -----------------------------------------------------------------------------------------------------------------
            local link = 'lock_links:megacreed'
            if redis:hget(chat_id , link) then
              link = "`Lock`"
            else
              link = "`Unlock`"
            end
			local bots = 'lock_bots:megacreed'
            if redis:hget(chat_id , bots) then
              bots = "`Lock`"
            else
              bots = "`Unlock`"
            end
			local setwarn = 'setwarn:megacreed'..msg.chat_id_
            if redis:get(setwarn) then
				if redis:get(setwarn) == "ban" then
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
					setwarn = "`Ban`"
					else
					setwarn = "`مسدوديت`"
					end
				end
				if redis:get(setwarn) == "kick" then
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
					setwarn = "`Kick`"
					else
					setwarn = "`اخراج`"
					end
				end
            end
		local setlock = 'setlock:megacreed'..msg.chat_id_
		if redis:get(setlock) then
            if redis:get(setlock) == "kick" then
			
				if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              setlock = "`Kick`"
				else
			  setlock = "`اخراج`"
                end
				
			end
			if redis:get(setlock) == "ban" then
			
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              setlock = "`Ban`"
				else
			  setlock = "`مسدود (بن)`"
                end
				
			end
			if redis:get(setlock) == "warn" then
			
		    	if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              setlock = "`Warn`"
				else
			  setlock = "`اخطار`"
                end
				
			end
			if redis:get(setlock) == "del" then
			
			    if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              setlock = "`Del`"
				else
			  setlock = "`پاک کردن`"
                end
				
	    	end
        end
			local mention = 'lock_mention:megacreed'
            if redis:hget(chat_id , mention) then
              mention = "`Lock`"
            else
              mention = "`Unlock`"
            end

            local flood = 'lock_flood:megacreed'
            if redis:hget(chat_id , flood) then
              flood = "`Lock`"
            else
              flood = "`Unlock`"
            end

            local spam = 'lock_spam:megacreed'
            if redis:hget(chat_id , spam) then
              spam = "`Lock`"
            else
              spam = "`Unlock`"
            end

            local shortmsg = 'lock_shortmsg:megacreed'
            if redis:hget(chat_id , shortmsg) then
              shortmsg = "`Lock`"
            else
              shortmsg = "`Unlock`"
            end

            local username = 'lock_username:megacreed'
            if redis:hget(chat_id , username) then
              username = "`Lock`"
            else
              username = "`Unlock`"
            end

            local tag = 'lock_tag:megacreed'
            if redis:hget(chat_id , tag) then
              tag = "`Lock`"
            else
              tag = "`Unlock`"
            end

            local forward = 'lock_forward:megacreed'
            if redis:hget(chat_id , forward) then
              forward = "`Lock`"
            else
              forward = "`Unlock`"
            end

            local arabic = 'lock_persian:megacreed'
            if redis:hget(chat_id , arabic) then
              arabic = "`Lock`"
            else
              arabic = "`Unlock`"
            end

            local eng = 'lock_english:megacreed'
            if redis:hget(chat_id , eng) then
              eng = "`Lock`"
            else
              eng = "`Unlock`"
            end

            local badword = 'lock_fosh:megacreed'
            if redis:hget(chat_id , badword) then
              badword = "`Lock`"
            else
              badword = "`Unlock`"
            end

            local edit = 'lock_edit:megacreed'
            if redis:hget(chat_id , edit) then
              edit = "`Lock`"
            else
              edit = "`Unlock`"
            end

            local location = 'lock_location:megacreed'
            if redis:hget(chat_id , location) then
              location = "`Lock`"
            else
              location = "`Unlock`"
            end

            local emoji = 'lock_emoji:megacreed'
            if redis:hget(chat_id , emoji) then
              emoji = "`Lock`"
            else
              emoji = "`Unlock`"
            end


            if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
              lang = '`English`'
            else
              lang = '`Persian`'
            end


            local caption = 'lock_caption:megacreed'
            if redis:hget(chat_id , caption) then
              caption = "`Lock`"
            else
              caption = "`Unlock`"
            end

            local inline = 'lock_inline:megacreed'
            if redis:hget(chat_id , inline) then
              inline = "`Lock`"
            else
              inline = "`Unlock`"
            end

            local reply = 'lock_reply:megacreed'
            if redis:hget(chat_id , reply) then
              reply = "`Lock`"
            else
              reply = "`Unlock`"
            end
            ----------------------------
            --muteall
             if ((msg.content_.text_:match("^[Mm]ute all (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(تعطیل) (%d+)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
				local ap = {string.match(msg.content_.text_ , "^([Mm]ute all) (%d+)$")}
				local app = {string.match(msg.content_.text_ , "^(تعطیل) (%d+)$")}
			 if redis:get('mute_all:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Mute All is already on</b>\nCommand was set by : '..get_info(redis:get('muter_all'..chat_id))
                else
                  text = 'همه ي پيام ها  از قبل در حالت حذف شدن هستند !\nتنظیم شده بود توسط :\n'..get_info(redis:get('muter_all'..chat_id))
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Mute All Has Been Enabled For '..(ap[2] or app[2])..' Hours!</b>\nCommand by : '..get_info(msg.sender_user_id_)
                else
                  text = 'همه ی پیام های بعدی به مدت '..(ap[2] or app[2])..' ساعت حذف خواهند شد ( گروه تعطيل شد ) \nتنظیم شد توسط :\n'..get_info(msg.sender_user_id_)..''
                end
				redis:setex('mute_all_time'..chat_id, ((ap[2] or app[2]) * 3600) ,true)
                redis:set('mute_all:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:all') or text), 1, 'html')
				redis:set('muter_all'..chat_id, msg.sender_user_id_)
              end
            end
            if ((msg.content_.text_:match("^[Mm]ute all$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف همه)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa") or (msg.content_.text_:match("^(تعطیل)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:get('mute_all:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Mute All is already on</b>\nCommand was set by : '..get_info(redis:get('muter_all'..chat_id))
                else
                  text = 'همه ي پيام ها  از قبل در حالت حذف شدن هستند !\nتنظیم شده بود توسط :\n'..get_info(redis:get('muter_all'..chat_id))
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Mute All Has Been Enabled !</b>\nCommand by : '..get_info(msg.sender_user_id_)
                else
                  text = 'همه ي پيام ها حذف خواهند شد ( گروه تعطيل شد ) \nتنظیم شد توسط :\n'..get_info(msg.sender_user_id_)..''
                end
                redis:set('mute_all:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:all') or text), 1, 'html')
				redis:set('muter_all'..chat_id, msg.sender_user_id_)
              end
            end
			
            if ((msg.content_.text_:match("^[Uu]nmute all$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(بازکردن همه)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa") or (msg.content_.text_:match("^(افتتاح)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if not redis:get('mute_all:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Mute All is already disabled</b>\nDisabled by : '..get_info(redis:get('unmuter_all'..chat_id))
                else
                  text = 'همه ي پيام ها از قبل حذف نميشدند !\nتنظیم شده بود توسط :\n'..get_info(redis:get('unmuter_all'..chat_id))
                end

                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '<b>Mute All has been Disabled</b>\nCommand By : '..get_info(msg.sender_user_id_)
                else
                  text = 'همه ي پيام ها از حالت حذف خارج شدند ( گروه باز شد ) !\nتوسط : \n'..get_info(msg.sender_user_id_)
                end
                redis:del('mute_all:megacreed'..chat_id)
				redis:del('mute_all_time'..chat_id)
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
				redis:set('unmuter_all'..chat_id, msg.sender_user_id_)
              end
            end


            --mute game


            if ((msg.content_.text_:match("^[Mm]ute game$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف بازی)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:get('mute_game:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute game is already on*'
                else
                  text = '*پيام هاي شامل بازي  از قبل در حالت حذف شدن هستند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute game Has Been Enabled*'
                else
                  text = '*پيام هاي شامل بازي حذف خواهند شد *'
                end
                redis:set('mute_game:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:game') or text), 1, 'md')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nmute game$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(بازکردن بازی)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if not redis:get('mute_game:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute game is already disabled*'
                else
                  text = '*پيام هاي شامل بازي از قبل حذف نميشدند !*'
                end

                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute game has been disabled*'
                else
                  text = '*پيام هاي شامل بازي از حالت حذف خارج شدند !*'
                end
                redis:del('mute_game:megacreed'..chat_id)
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              end
            end


            --mute sticker


            if ((msg.content_.text_:match("^[Mm]ute sticker$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف استیکر)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:get('mute_sticker:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute sticker is already on*'
                else
                  text = '*پيام هاي شامل استيکر  از قبل در حالت حذف شدن هستند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute sticker Has Been Enabled*'
                else
                  text = '*پيام هاي شامل استيکر حذف خواهند شد *'
                end
                redis:set('mute_sticker:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:sticker') or text), 1, 'md')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nmute sticker$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(بازکردن استیکر)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if not redis:get('mute_sticker:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute sticker is already disabled*'
                else
                  text = '*پيام هاي شامل استيکر از قبل حذف نميشدند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute sticker has been disabled*'
                else
                  text = '*پيام هاي شامل استيکر از حالت حذف خارج شدند !*'
                end
                redis:del('mute_sticker:megacreed'..chat_id)
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              end
            end


            --mute gif

            if ((msg.content_.text_:match("^[Mm]ute gif$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف گیف)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:get('mute_gif:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute gif is already on*'
                else
                  text = '*پيام هاي شامل گيف  از قبل در حالت حذف شدن هستند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute gif Has Been Enabled*'
                else
                  text = '*پيام هاي شامل گيف حذف خواهند شد *'
                end
                redis:set('mute_gif:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:gif') or text), 1, 'md')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nmute gif$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(بازکردن گیف)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if not redis:get('mute_gif:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute gif is already disabled*'
                else
                  text = '*پيام هاي شامل گيف از قبل حذف نميشدند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute gif has been disabled*'
                else
                  text = '*پيام هاي شامل گيف از حالت حذف خارج شدند !*'
                end
                redis:del('mute_gif:megacreed'..chat_id)
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              end
            end



            --mute markdown

            if ((msg.content_.text_:match("^[Mm]ute markdown$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل زیبانویس)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:get('mute_weblink:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Markdown is already on*'
                else
                  text = '*پيام هاي شامل رنگ  از قبل در حالت حذف شدن هستند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Markdown Has Been Enabled*'
                else
                  text = '*پيام هاي شامل رنگ حذف خواهند شد *'
                end
                redis:set('mute_weblink:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:markdown') or text), 1, 'md')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nmute markdown$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(بازکردن زیبانویس)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if not redis:get('mute_weblink:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Markdown is already disabled*'
                else
                  text = '*پيام هاي شامل رنگ از قبل حذف نميشدند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Markdown has been disabled*'
                else
                  text = '*پيام هاي شامل رنگ از حالت حذف خارج شدند !*'
                end
                redis:del('mute_weblink:megacreed'..chat_id)
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              end
            end


            --mute weblink


            if ((msg.content_.text_:match("^[mM]ute weblink$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(قفل سایت)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:get('mute_weblink:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Web Link is already on*'
                else
                  text = '*پيام هاي شامل لينک سايت  از قبل در حالت حذف شدن هستند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Web Link Has Been Enabled*'
                else
                  text = '*پيام هاي شامل لينک سايت حذف خواهند شد *'
                end
                redis:set('mute_weblink:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:weblink') or text), 1, 'md')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nmute weblink$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(بازکردن سایت)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if not redis:get('mute_weblink:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Web Link is already disabled*'
                else
                  text = '*پيام هاي شامل لينک سايت از قبل حذف نميشدند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Web Link has been disabled*'
                else
                  text = '*پيام هاي شامل لينک سايت از حالت حذف خارج شدند !*'
                end
                redis:del('mute_weblink:megacreed'..chat_id)
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              end
            end


            --mute Keyboard

            if ((msg.content_.text_:match("^[Mm]ute keyboard$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف کیبورد)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:get('mute_keyboard:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Keyboard is already on*'
                else
                  text = '*پيام هاي شامل دکمه شيشه اي ربات ها  از قبل در حالت حذف شدن هستند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Keyboard Has Been Enabled*'
                else
                  text = '*پيام هاي شامل دکمه شيشه اي ربات ها حذف خواهند شد *'
                end
                redis:set('mute_keyboard:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:keyboard') or text), 1, 'md')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nmute keyboard$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(بازکردن کیبورد)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if not redis:get('mute_keyboard:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Keyboard is already disabled*'
                else
                  text = '*پيام هاي شامل دکمه شيشه اي ربات ها از قبل حذف نميشدند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Keyboard has been disabled*'
                else
                  text = '*پيام هاي شامل دکمه شيشه اي ربات ها از حالت حذف خارج شدند !*'
                end
                redis:del('mute_keyboard:megacreed'..chat_id)
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              end
            end


            --mute contact


            if ((msg.content_.text_:match("^[Mm]ute contact$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(حذف مخاطب)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:get('mute_contact:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute contact is already on*'
                else
                  text = '*پيام هاي اشتراک مخاطب  از قبل در حالت حذف شدن هستند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute contact Has Been Enabled*'
                else
                  text = '*پيام هاي اشتراک مخاطب حذف خواهند شد *'
                end
                redis:set('mute_contact:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:contact') or text), 1, 'md')
              end
            end
            if ((msg.content_.text_:match("^[Uu]nmute contact$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^(بازکردن مخاطب)$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if not redis:get('mute_contact:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute contact is already disabled*'
                else
                  text = '*پيام هاي اشتراک مخاطب از قبل حذف نميشدند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute contact has been disabled*'
                else
                  text = '*پيام هاي اشتراک مخاطب از حالت حذف خارج شدند !*'
                end
                redis:del('mute_contact:megacreed'..chat_id)
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              end
            end

            --mute photo

            if ((msg.content_.text_:match("^[Mm]ute photo$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^حذف عکس$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:get('mute_photo:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Photo is already on*'
                else
                  text = '*پيام هاي شامل عکس  از قبل در حالت حذف شدن هستند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Photo Has Been Enabled*'
                else
                  text = '*پيام هاي شامل عکس حذف خواهند شد *'
                end
                redis:set('mute_photo:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:photo') or text), 1, 'md')
              end
            end
            if ((msg.content_.text_:match("^[Uu]n[Mm]ute photo$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^بازکردن عکس$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if not redis:get('mute_photo:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Photo is already disabled*'
                else
                  text = '*پيام هاي شامل عکس از قبل حذف نميشدند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Photo has been disabled*'
                else
                  text = '*پيام هاي شامل عکس از حالت حذف خارج شدند !*'
                end
                redis:del('mute_photo:megacreed'..chat_id)
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              end
            end

            --mute audio
            if ((msg.content_.text_:match("^[Mm]ute audio$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^حذف ترانه$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:get('mute_audio:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute audio is already on*'
                else
                  text = '*پيام هاي شامل ترانه و موسيقي  از قبل در حالت حذف شدن هستند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute audio Has Been Enabled*'
                else
                  text = '*پيام هاي شامل ترانه و موسيقي  حذف خواهند شد *'
                end
                redis:set('mute_audio:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:audio') or text), 1, 'md')
              end
            end
            if ((msg.content_.text_:match("^[Uu]n[Mm]ute audio$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^بازکردن ترانه$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if not redis:get('mute_audio:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute audio is already disabled*'
                else
                  text = '*پيام هاي شامل ترانه و موسيقي  از قبل حذف نميشدند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute audio has been disabled*'
                else
                  text = '*پيام هاي شامل ترانه و موسيقي  از حالت حذف خارج شدند !*'
                end
                redis:del('mute_audio:megacreed'..chat_id)
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              end
            end

            --mute voice
            if ((msg.content_.text_:match("^[Mm]ute voice$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^حذف صدا$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:get('mute_voice:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Voice is already on*'
                else
                  text = '*پيام هاي شامل صدا  از قبل در حالت حذف شدن هستند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Voice Has Been Enabled*'
                else
                  text = '*پيام هاي شامل صدا حذف خواهند شد *'
                end
                redis:set('mute_voice:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:voice') or text), 1, 'md')
              end
            end
            if ((msg.content_.text_:match("^[Uu]n[Mm]ute voice$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^بازکردن صدا$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if not redis:get('mute_voice:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Voice is already disabled*'
                else
                  text = '*پيام هاي شامل صدا از قبل حذف نميشدند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Voice has been disabled*'
                else
                  text = '*پيام هاي شامل صدا از حالت حذف خارج شدند !*'
                end
                redis:del('mute_voice:megacreed'..chat_id)
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              end
            end

            --mute video
            if ((msg.content_.text_:match("^[Mm]ute video$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^حذف فیلم$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:get('mute_video:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Video is already on*'
                else
                  text = '*پيام هاي شامل فيلم  از قبل در حالت حذف شدن هستند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Video Has Been Enabled*'
                else
                  text = '*پيام هاي شامل فيلم حذف خواهند شد *'
                end
                redis:set('mute_video:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:video') or text), 1, 'md')
              end
            end
            if ((msg.content_.text_:match("^[Uu]n[Mm]ute video$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^بازکردن فیلم$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if not redis:get('mute_video:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Video is already disabled*'
                else
                  text = '*پيام هاي شامل فيلم از قبل حذف نميشدند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Video has been disabled*'
                else
                  text = '*پيام هاي شامل فيلم از حالت حذف خارج شدند !*'
                end
                redis:del('mute_video:megacreed'..chat_id)
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              end
            end

            --mute document

            if ((msg.content_.text_:match("^[Mm]ute document$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^حذف فایل$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:get('mute_document:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Document [ File ] is already on*'
                else
                  text = '*پيام هاي شامل فايل  از قبل در حالت حذف شدن هستند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Document [ File ] Has Been Enabled*'
                else
                  text = '*پيام هاي شامل فايل حذف خواهند شد *'
                end
                redis:set('mute_document:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:document') or text), 1, 'md')
              end
            end
            if ((msg.content_.text_:match("^[Uu]n[Mm]ute document$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^بازکردن فایل$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if not redis:get('mute_document:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Document [ File ] is already disabled*'
                else
                  text = '*پيام هاي شامل فايل از قبل حذف نميشدند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Document [ File ] has been disabled*'
                else
                  text = '*پيام هاي شامل فايل از حالت حذف خارج شدند !*'
                end
                redis:del('mute_document:megacreed'..chat_id)
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              end
            end


            --mute  text

            if ((msg.content_.text_:match("^[Mm]ute text$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^حذف متن$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:get('mute_text:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Text is already on*'
                else
                  text = '*پيام هاي شامل متن  از قبل در حالت حذف شدن هستند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Text Has Been Enabled*'
                else
                  text = '*پيام هاي شامل متن حذف خواهند شد *'
                end
                redis:set('mute_text:megacreed'..chat_id, "True")
                sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:text') or text), 1, 'md')
              end
            end
            if ((msg.content_.text_:match("^[Uu]n[Mm]ute text$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^بازکردن متن$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if not redis:get('mute_text:megacreed'..chat_id) then
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Text is already disabled*'
                else
                  text = '*پيام هاي شامل متن از قبل حذف نميشدند !*'
                end
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              else
                if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                  text = '*Mute Text has been disabled*'
                else
                  text = '*پيام هاي شامل متن از حالت حذف خارج شدند !*'
                end
                redis:del('mute_text:megacreed'..chat_id)
                sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'md')
              end
            end


            --settings
            local all = 'mute_all:megacreed'..chat_id
            if redis:get(all) then
              All = "`Mute`"
            else
              All = "`UnMute`"
            end

            local spammax = 'maxspam:megacreed'..chat_id
            if not redis:get(spammax) then
              spammax = tonumber(2000)
            else
              spammax = redis:get('maxspam:megacreed'..chat_id)
            end

            local shortmsgmax = 'shortmsgmax:megacreed'..chat_id
            if not redis:get(shortmsgmax) then
              shortmsgmax = tonumber(10)
            else
              shortmsgmax = redis:get('shortmsgmax:megacreed'..chat_id)
            end

            if not redis:get('floodnum:megacreed'..msg.chat_id_) then
              floodnum = 5
            else
              floodnum = redis:get('floodnum:megacreed'..msg.chat_id_)
            end
            ------------
            if not redis:get('floodtime:megacreed'..msg.chat_id_) then
              floodtime = 3
            else
              floodtime = redis:get('floodtime:megacreed'..msg.chat_id_)
            end
			
			
			if not redis:get('warnmax:megacreed'..msg.chat_id_) then
              warnmax = 3
            else
              warnmax = redis:get('warnmax:megacreed'..msg.chat_id_)
            end
			
            local sticker = 'mute_sticker:megacreed'..chat_id
            if redis:get(sticker) then
              sticker = "`Mute`"
            else
              sticker = "`UnMute`"
            end


            local game = 'mute_game:megacreed'..chat_id
            if redis:get(game) then
              game = "`Mute`"
            else
              game = "`UnMute`"
            end

            local keyboard = 'mute_keyboard:megacreed'..chat_id
            if redis:get(keyboard) then
              keyboard = "`Mute`"
            else
              keyboard = "`UnMute`"
            end

            local gif = 'mute_gif:megacreed'..chat_id
            if redis:get(gif) then
              gif = "`Mute`"
            else
              gif = "`UnMute`"
            end

            local markdown = 'mute_weblink:megacreed'..chat_id
            if redis:get(markdown) then
              markdown = "`Mute`"
            else
              markdown= "`UnMute`"
            end

            local weblink = 'mute_weblink:megacreed'..chat_id
            if redis:get(weblink) then
              weblink = "`Mute`"
            else
              weblink = "`UnMute`"
            end

            local contact = 'mute_contact:megacreed'..chat_id
            if redis:get(contact) then
              contact = "`Mute`"
            else
              contact = "`UnMute`"
            end

            local photo = 'mute_photo:megacreed'..chat_id
            if redis:get(photo) then
              photo = "`Mute`"
            else
              photo = "`UnMute`"
            end

            local audio = 'mute_audio:megacreed'..chat_id
            if redis:get(audio) then
              audio = "`Mute`"
            else
              audio = "`UnMute`"
            end

            local voice = 'mute_voice:megacreed'..chat_id
            if redis:get(voice) then
              voice = "`Mute`"
            else
              voice = "`UnMute`"
            end

            local video = 'mute_video:megacreed'..chat_id
            if redis:get(video) then
              video = "`Mute`"
            else
              video = "`UnMute`"
            end

            local document = 'mute_document:megacreed'..chat_id
            if redis:get(document) then
              document = "`Mute`"
            else
              document = "`UnMute`"
            end

            local text1 = 'mute_text:megacreed'..chat_id
            if redis:get(text1) then
              text1 = "`Mute`"
            else
              text1 = "`UnMute`"
            end

            local ex = redis:ttl('bot:charge:megacreed'..msg.chat_id_)
            if ex == -1 then
              exp_dat = 'Unlimited'
            else
              exp_dat = math.floor(ex / 86400) + 1
            end

            if ((msg.content_.text_:match("^[Ss]ettings$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^تنظیمات$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
              if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
                text = "_Settings :_".."\n---------------------\n"
				.."*Lock Action :* "..setlock.."\n"
				.."*Warn Action :* "..setwarn.."\n"
				.."*Warn Max :* "..warnmax.."\n"
                .."*Group Expire Time :* "..exp_dat.." *Days Later !*\n"
                .."*Group Language :* "..lang.."\n"
                .."*Flood Time :* "..floodtime.."\n"
                .."*Flood Num : *"..floodnum.."\n"
                .."*Lock Flood : *"..flood.."\n"
                .."*Max Spam Character : *"..spammax.."\n"
                .."*Lock Spam : *"..spam.."\n"
                .."*Max Short Msg Character : *"..shortmsgmax.."\n"
                .."*Lock Short Messages : *"..shortmsg.."\n"
                .."*Lock Link : *"..link.."".."\n"
				.."*Lock Bots : *"..bots.."".."\n"
				.."*Lock Mention : *"..mention.."".."\n"
                .."*Lock Tag : *"..""..tag.."".."\n"
                .."*Lock Username : *"..""..username.."".."\n"
                .."*Lock Forward : *"..""..forward.."".."\n"
                .."*Lock Persian : *"..""..arabic..''..'\n'
                .."*Lock English : *"..""..eng..''..'\n'
                .."*Lock Reply : *"..""..reply..''..'\n'
                .."*Lock Fosh : *"..""..badword..''..'\n'
                .."*Lock Edit : *"..""..edit..''..'\n'
                .."*Lock location : *"..""..location..''..'\n'
                .."*Lock Caption : *"..""..caption..''..'\n'
                .."*Lock Inline : *"..""..inline..''..'\n'
                .."*Lock Emoji : *"..""..emoji..''..'\n---------------------\n'
                .."_Mute List_ :".."\n\n"
                .."*Mute All : *"..""..All.."".."\n"
                .."*Mute Keyboard : *"..""..keyboard.."".."\n"
                .."*Mute Sticker : *"..""..sticker.."".."\n"
                .."*Mute Markdown : *"..""..markdown.."".."\n"
                .."*Mute WebLinks : *"..""..weblink.."".."\n"
                .."*Mute Game : *"..""..game.."".."\n"
                .."*Mute Gif : *"..""..gif.."".."\n"
                .."*Mute Contact : *"..""..contact.."".."\n"
                .."*Mute Photo : *"..""..photo.."".."\n"
                .."*Mute Audio : *"..""..audio.."".."\n"
                .."*Mute Voice : *"..""..voice.."".."\n"
                .."*Mute Video : *"..""..video.."".."\n"
                .."*Mute Document : *"..""..document.."".."\n"
                .."*Mute Text : *"..text1..""
              else
                text = "_تنظيمات :_".."\n---------------------\n"
				.."*واکنش به قفل شده ها :* "..setlock.."\n"
				.."*واکنش به اخطار ها :* "..setwarn.."\n"
				.."*تعداد بيشترين مقدار اخطار :* "..warnmax.."\n"
                .."*تاريخ انقضاي گروه :* "..exp_dat.." *روز بعد !*\n"
                .."*زبان گروه :* "..lang.."\n"
                .."*زمان رگباري :* "..floodtime.."\n"
                .."*تعداد رگباري : *"..floodnum.."\n"
                .."*قفل پيام رگباري: *"..flood.."\n"
                .."*بيشترين مقدار کاراکتر پيام : *"..spammax.."\n"
                .."*قفل پيام با کاراکتر زياد : *"..spam.."\n"
                .."*کمترين مقدار کاراکتر پيام : *"..shortmsgmax.."\n"
                .."*قفل پيام با کاراکتر کم : *"..shortmsg.."\n"
                .."*قفل فراخواني : *"..mention.."".."\n"
				.."*قفل ربات : *"..bots.."".."\n"
				.."*قفل لينک : *"..link.."".."\n"
                .."*قفل تگ : *"..""..tag.."".."\n"
                .."*قفل نام کاربري : *"..""..username.."".."\n"
                .."*قفل فوروارد ( نقل قول ) : *"..""..forward.."".."\n"
                .."*قفل حروف فارسي : *"..""..arabic..''..'\n'
                .."*قفل حرو انگليسي : *"..""..eng..''..'\n'
                .."*قفل ريپلي ( پاسخ ب پيام ) : *"..""..reply..''..'\n'
                .."*قفل فحش  : *"..""..badword..''..'\n'
                .."*قفل ويرايش پيام : *"..""..edit..''..'\n'
                .."*قفل اشتراک مکان : *"..""..location..''..'\n'
                .."*قفل متن زير عکس و ... : *"..""..caption..''..'\n'
                .."*قفل حالت اينلاين ربات ها : *"..""..inline..''..'\n'
                .."*قفل شکلک ها : *"..""..emoji..''..'\n---------------------\n'
                .."_ليست پيام هاي حذف شده_ :".."\n\n"
                .."*حذف همه پيام ها ( تعطيلي گروه ) : *"..""..All.."".."\n"
                .."*حذف دکمه شيشه اي ربات : *"..""..keyboard.."".."\n"
                .."*حذف استيکر : *"..""..sticker.."".."\n"
                .."*حذف پيام هاي زيبا : *"..""..markdown.."".."\n"
                .."*حذف لينک سايت : *"..""..weblink.."".."\n"
                .."*حذف بازي هاي رباتي : *"..""..game.."".."\n"
                .."*حذف گيف ( عکس متحرک ) : *"..""..gif.."".."\n"
                .."*حذف اشتراک مخاطب : *"..""..contact.."".."\n"
                .."*حذف عکس : *"..""..photo.."".."\n"
                .."*حذف ترانه : *"..""..audio.."".."\n"
                .."*حذف صدا : *"..""..voice.."".."\n"
                .."*حذف فيلم : *"..""..video.."".."\n"
                .."*حذف فايل : *"..""..document.."".."\n"
                .."*حذف پيام متني : *"..text1..""
                text1 = string.gsub(text,"`Lock`", "`بله`")
                text2 = string.gsub(text1,"`Unlock`","`خير`")
                text3 = string.gsub(text2,"`English`","`انگليسي`")
                text4 = string.gsub(text3,"`Persian`","`فارسي`")
                text5 = string.gsub(text4,"`Mute`","`فعال`")
                text6 = string.gsub(text5,"`UnMute`","`غيرفعال`")
                text = text6
              end
              sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:settings') or text), 1, 'md')
            end
            if msg.content_.text_:match("^[Ff]wd$") then
              tdcli.forwardMessages(chat_id, chat_id,{[0] = reply_id}, 0)
            end


			if ((msg.content_.text_:match("^[Rr]eset all$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^حالت کارخانه$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_owner(msg) then
			redis:set('setwarn:megacreed'..msg.chat_id_, 'kick')
			for k,v in pairs(redis:smembers('muteusers:megacreed'..msg.chat_id_)) do
			redis:srem('muteusers:megacreed'..msg.chat_id_, v)
			end
			for k,v in pairs(redis:smembers('promotes:megacreed'..msg.chat_id_)) do
			redis:srem('promotes:megacreed'..msg.chat_id_, v)
			end
			for k,v in pairs(redis:smembers('filters:megacreed'..msg.chat_id_)) do
			redis:srem('filters:megacreed'..msg.chat_id_, v)
			end
			redis:set('shortmsgmax:megacreed'..msg.chat_id_, 20)
			redis:hset(msg.chat_id_,'lang:megacreed', "fa")
			redis:set('setlock:megacreed'..msg.chat_id_, "del")
			redis:del('welcome:gp:megacreed'..msg.chat_id_)
			redis:set('warnmax:megacreed'..msg.chat_id_ , 3)
			redis:set('gp:cmd:megacreed'..msg.chat_id_, "all")
            redis:del('promotes:megacreed'..chat_id)
            redis:del('muteusers:megacreed'..chat_id)
            redis:del('mute_user:megacreed'..chat_id)
            redis:set('floodtime:megacreed'..chat_id, tonumber(3))
            redis:set('floodnum:megacreed'..chat_id, tonumber(5))
            redis:set('maxspam:megacreed'..chat_id, tonumber(2000))
            redis:hdel(chat_id , 'lock_username:megacreed')
			redis:hdel(chat_id , 'lock_mention:megacreed')
            redis:hdel(chat_id , 'lock_links:megacreed')
            redis:hdel(chat_id , 'lock_bots:megacreed')
            redis:hdel(chat_id , 'lock_tag:megacreed')
            redis:hdel(chat_id , 'lock_forward:megacreed')
            redis:hdel(chat_id , 'lock_persian:megacreed')
            redis:hdel(chat_id , 'lock_english:megacreed')
            redis:hdel(chat_id , 'lock_fosh:megacreed')
            redis:hdel(chat_id , 'lock_location:megacreed')
            redis:hdel(chat_id , 'lock_edit:megacreed')
            redis:hdel(chat_id , 'lock_caption:megacreed')
            redis:hdel(chat_id , 'lock_emoji:megacreed')
            redis:hdel(chat_id , 'lock_inline:megacreed')
            redis:hdel(chat_id , 'lock_reply:megacreed')
            redis:hdel(chat_id , 'lock_spam:megacreed')
            redis:hdel(chat_id , 'lock_shortmsg:megacreed')
            redis:hdel(chat_id , 'lock_flood:megacreed')
            redis:del('mute_all:megacreed'..chat_id)
            redis:del('mute_text:megacreed'..chat_id)
            redis:del('mute_game:megacreed'..chat_id)
            redis:del('mute_sticker:megacreed'..chat_id)
            redis:del('mute_contact:megacreed'..chat_id)
            redis:del('mute_gif:megacreed'..chat_id)
            redis:del('mute_voice:megacreed'..chat_id)
            redis:del('mute_weblink:megacreed'..chat_id)
            redis:del('mute_weblink:megacreed'..chat_id)
            redis:del('mute_keyboard:megacreed'..chat_id)
            redis:del('mute_photo:megacreed'..chat_id)
            redis:del('mute_audio:megacreed'..chat_id)
            redis:del('mute_video:megacreed'..chat_id)
            redis:del('mute_document:megacreed'..chat_id)
			if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
			text = '`Successfull !`\n*All Information of Group has been Set to Default !*'
			else
			text = '`تراکنش موفق !`\n*همه ی تنظیمات گروه به حالت اولیه برگشت !*'
			end
			sendmsg(msg.chat_id_, 0, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:reset') or text), 1, 'md')
			end
            if msg.content_.text_:match("^[Oo]wnerlist$") and is_admin(msg) then
              text = "<b>Owners List :</b>\n\n"
              for k,v in pairs(redis:smembers('groups:megacreed')) do
			  local tt = redis:get('owners:megacreed'..v)
                sendmsg(msg.chat_id_, 0, 0, 1, nil, '<code>Group :</code> '..v..' <b>>></b> '..get_info(tt), 1, 'html')
              end
            end
			
			
			
            if msg.content_.text_:match("^[Ff]wdall$") and msg.reply_to_message_id_ then
              for k,v in pairs(redis:smembers('bot:groupss:megacreeps')) do
                tdcli.forwardMessages(v, chat_id,{[0] = reply_id}, 0)
              end
            end
            if ((msg.content_.text_:match("^[Uu]n[Ww]arn$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^حذف اخطار$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
			local function dewarn_reply(extra , result, success)
              redis:del('warns:megacreed'..result.chat_id_..result.sender_user_id_)
			  if redis:hget(result.chat_id_, 'lang:megacreed') == "en" then
				text = "*User Warns Has been Removed Successfully !*"
				else
				text = "اخطار هاي کاربر حذف شد !"
			  end
			  sendmsg(result.chat_id_, result.id_, 0, 1, nil, text, 1, 'md')
			  end
			  getMessage(msg.chat_id_, msg.reply_to_message_id_,dewarn_reply)
            end

            if msg.content_.text_:match("^[Uu]sername @(.*)$") and is_sudo(msg) then
              tdcli.changeUsername(msg.content_.text_:match("^[Uu]sername (.*)$"))
              sendmsg(chat_id, msg.id_, 0, 1, nil, '<b>Username Changed To </b>@'..msg.content_.text_:match("^[Uu]sername (.*)$"), 1, 'html')
            end

            if msg.content_.text_:match("^[Ee]cho") and is_mod(msg) then
              sendmsg(chat_id, msg.id_, 0, 1, nil, string.sub(input, 6), 1, 'md')
            end
            if msg.content_.text_:match("^[Ss]etname") and is_mod(msg) then
              tdcli.changeChatTitle(chat_id, string.sub(input, 9), 1)
              sendmsg(chat_id, msg.id_, 0, 1, nil, '<b>SuperGroup Name Changed To </b><code>'..string.sub(input, 10)..'</code>', 1, 'html')
            end
            if msg.content_.text_:match("^[Cc]hangename") and is_sudo(msg) then
              tdcli.changeName(string.sub(input, 12), nil, 1)
              sendmsg(chat_id, msg.id_, 0, 1, nil, '<b>Bot Name Changed To :</b><code>'..string.sub(input, 13)..'</code>', 1, 'html')
            end
            if msg.content_.text_:match("^[Cc]hangeuser") and is_sudo(msg) then
              tdcli.changeUsername(string.sub(input, 12), nil, 1)
              sendmsg(chat_id, msg.id_, 0, 1, nil, '<b>Bot UserName Changed To </b><code>'..string.sub(input, 13)..'</code>', 1, 'html')
            end
            if msg.content_.text_:match("^[Dd]eluser") and is_sudo(msg) then
              tdcli.changeUsername('')
              sendmsg(chat_id, msg.id_, 0, 1, nil, '`Successfull !`\n*Username Has been Deleted !*', 1, 'html')
            end
            if msg.content_.text_:match("^[Ee]dit") and is_admin(msg) then
              tdcli.editMessageText(chat_id, reply_id, nil, string.sub(input, 6), 'html')
            end

            if ((msg.content_.text_:match("^[Ss]how edit$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^نمایش ویرایش$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
		
		if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
		text = "*Done !*\nEdited Messages Will Be Shown !"
		else
		text = "با موفقیت انجام شد !\nپیام های ادیت شده لو داده خواهند شد !"
		end
				sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:show') or text), 1, 'md')
				redis:set('editmsg:megacreed'..msg.chat_id_,'didam')
			end

            if ((msg.content_.text_:match("^[Hh]ide edit$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^پنهان ویرایش$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg)  then
		
		if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
		text = "*Done !*\nEdited Messages Will Not Be Shown !"
		else
		text = "با موفقیت انجام شد !\nپیام های ادیت شده لو نداده خواهند شد !"
		end
				sendmsg(chat_id, msg.id_, 0, 1, nil, (redis:hget(msg.chat_id_ , 'answer:hide') or text), 1, 'md')
				redis:set('editmsg:megacreed'..msg.chat_id_,'nadidam')
			end

            if msg.content_.text_:match("^[Ii]nvite") and is_admin(msg) then
              tdcli.addChatMember(chat_id, string.sub(input, 9), 20)
            end
            if msg.content_.text_:match("^[Cc]reatesuper") and is_sudo(msg) then
              tdcli.createNewChannelChat(string.sub(input, 14), 1, 'My Supergroup, my rules')
              sendmsg(chat_id, msg.id_, 0, 1, nil, '<b>SuperGroup </b>'..string.sub(input, 14)..' <b>Created</b>', 1, 'html')
            end
			   if msg.content_.text_:match('^[Ww]hois (%d+)$') and is_mod(msg) then
              matches = {string.match(msg.content_.text_, "^(whois) (%d+)$")}
              send_hyper_msg(chat_id, msg.id_, "click to view\nUser id : "..matches[2].."", matches[2])
            end
			
            if ((msg.content_.text_:match("^[Dd]el$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^بپاک$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and msg.reply_to_message_id_ ~= 0 and is_mod(msg)then
              tdcli.deleteMessages(msg.chat_id_, {[0] = msg.reply_to_message_id_})
              tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
            end

            if ((msg.content_.text_:match("^[Tt]osuper$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^ارتقای گروه$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
              local gpid = msg.chat_id_
              tdcli.migrateGroupChatToChannelChat(gpid)
            end

            if ((msg.content_.text_:match("^[Mm]arkread on$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^نمایش تیک$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
		redis:set('markread:megacreed'..msg.chat_id_, true)
              sendmsg(chat_id, msg.id_, 0, 1, nil, '<b>Mark Read has been Enabled !</b>', 1, 'html')
	     end
            if ((msg.content_.text_:match("^[Mm]arkread off$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^پنهان تیک$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
		redis:del('markread:megacreed'..msg.chat_id_)
              sendmsg(chat_id, msg.id_, 0, 1, nil, '<b>Mark Read has been Disabled !</b>', 1, 'html')
	     end
            if ((msg.content_.text_:match("^[Vv]iew$") and redis:get('commands:megacreed'..msg.chat_id_) == "en") or (msg.content_.text_:match("^تیک$") and redis:get('commands:megacreed'..msg.chat_id_) == "fa")) and is_mod(msg) then
              tdcli.viewMessages(chat_id, {[0] = msg.id_})
              sendmsg(chat_id, msg.id_, 0, 1, nil, '<b>Messages Viewed</b>', 1, 'html')
            end
          end
		end
        ---
end
if msg.content_.reply_markup_ then
          if redis:get('mute_keyboard:megacreed'..chat_id) or redis:get('mute_all:megacreed'..msg.chat_id_) then
            if  msg.content_.reply_markup_ and not is_mod(msg) then
              tdcli.deleteMessages(chat_id, {[0] = msg.id_})
            end
          end
        end
       

if msg.content_.entities_ and msg.content_.entities_[0] then

	if msg.content_.entities_[0].ID == "MessageEntityMentionName" then
			if redis:hget(chat_id , 'lock_mention:megacreed') and not (is_mod(msg) or is_allowed(msg)) then
	-- setlimit
		limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'mention') or tostring(0)
		print(limits)
		if limits > tostring(0) then
		redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'mention', limits - tostring(1))
		  else
if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) > redis:get('warnmax:megacreed'..msg.chat_id_) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						end
						if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..msg.sender_user_id_.." <b> Has been Banned</b>\nReason : <code>Mention Sent !</code>"
					else
						text = "کاربر : "..msg.sender_user_id_.." <b> مسدود شد</b>\n علت : <code>فراخواني کاربر !</code>"
					end
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
		        sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
				end
					redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..msg.sender_user_id_.." <b> Has been Banned</b>\nReason : <code>Mention Sent !</code>"
					else
						text = "کاربر : "..msg.sender_user_id_.." <b> مسدود شد</b>\n علت : <code>فراخواني کاربر !</code>"
					end
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
		        sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
				end
			end
		end
	end
	if msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
 if redis:get('mute_weblink:megacreed'..msg.chat_id_) then
	  if is_mod(msg) or is_allowed(msg) then
            return
          else
            tdcli.deleteMessages(chat_id, {[0] = msg.id_})
          end
        end
end

        --------        msg checks
	if msg.content_.entities_[0].ID == "MessageEntityBold" or msg.content_.entities_[0].ID == "MessageEntityCode" or msg.content_.entities_[0].ID == "MessageEntityPre" or msg.content_.entities_[0].ID == "MessageEntityItalic" then

        if redis:get('mute_weblink:megacreed'..msg.chat_id_) then
          if is_mod(msg) or is_allowed(msg) then
            return
          else
            tdcli.deleteMessages(chat_id, {[0] = msg.id_})
          end
        end
        end
end


	 
if msg.content_.ID == "MessageForwarded" then


	if redis:hget(chat_id , 'lock_forward:megacreed') and (not is_mod(msg) or not is_allowed(msg)) then
	-- setlimit
		limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'forward') or tostring(0)
		print(limits)
		if limits > tostring(0) then
		redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'forward', limits - tostring(1))
		  else
if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) > redis:get('warnmax:megacreed'..msg.chat_id_) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						end
						if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..msg.sender_user_id_.." <b> Has been Banned</b>\nReason : <code>Mention Sent !</code>"
					else
						text = "کاربر : "..msg.sender_user_id_.." <b> مسدود شد</b>\n علت : <code>فوروارد پيام</code>"
					end
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
		        sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
				end
					end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..msg.sender_user_id_.." <b> Has been Banned</b>\nReason : <code>Mention Sent !</code>"
					else
						text = "کاربر : "..msg.sender_user_id_.." <b> مسدود شد</b>\n علت : <code>فوروارد پيام</code>"
					end
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
		        sendmsg(chat_id, msg.id_, 0, 1, nil, text, 1, 'html')
				end
          end
		end


if redis:hget(chat_id , 'lock_links:megacreed') and (msg.content_.text_:match("[Hh]ttps://[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/(.*)") or msg.content_.text_:match("[Hh]ttps://[Tt].[Mm][Ee]/(.*)")) and (not is_mod(msg) or not is_allowed(msg)) then
-- setlimit
		limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'links') or tostring(0)
		print(limits)
		if limits > tostring(0) then
		redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'links', limits - tostring(1))
		  else
			if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Links Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال لینک !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Links Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال لینک !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Links Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال لینک !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Links Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال لینک !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Links Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال لینک !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
          end
		end
		
		

          if redis:hget(chat_id , 'lock_tag:megacreed') and msg.content_.text_:find("#") and (not is_mod(msg) or not is_allowed(msg)) then
		  -- setlimit
		limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'tag') or tostring(0)
		print(limits)
		if limits > tostring(0) then
		redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'tag', limits - tostring(1))
		  else
	if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Tag[#] Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال هشتگ!</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Tag[#] Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال هشتگ!</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Tag[#] Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال هشتگ!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Tag[#] Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال هشتگ!</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Tag[#] Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال هشتگ!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
          end
end



          if redis:hget(chat_id , 'lock_username:megacreed') and msg.content_.text_:find("@") and (not is_mod(msg) or not is_allowed(msg)) then
		  -- setlimit
		limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'username') or tostring(0)
		print(limits)
		if limits > tostring(0) then
		redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'username', limits - tostring(1))
		  else
if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Username[@] Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال یوزرنیم!</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Username[@] Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال یوزرنیم!</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Username[@] Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال یوزرنیم!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Username[@] Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال یوزرنیم!</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Username[@] Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال یوزرنیم!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
			end
		end
			
			
			
			
			
			
          if redis:hget(chat_id , 'lock_persian:megacreed') and msg.content_.text_:find("[\216-\219][\128-\191]") and (not is_mod(msg) or not is_allowed(msg)) then
		  -- setlimit
		limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'persian') or tostring(0)
		print(limits)
		if limits > tostring(0) then
		redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'persian', limits - tostring(1))
		  else
		if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Persian Words Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال حروف فارسی!</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Persian Words Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال حروف فارسی!</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Persian Words Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال حروف فارسی!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Persian Words Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال حروف فارسی!</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Persian Words Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال حروف فارسی!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
          end
		  end

        

          local is_english_msg = msg.content_.text_:find("[a-z]") or msg.content_.text_:find("[A-Z]")
          if redis:hget(chat_id , 'lock_english:megacreed') and is_english_msg and (not is_mod(msg) or not is_allowed(msg)) then
		  -- setlimit
		limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'english') or tostring(0)
		print(limits)
		if limits > tostring(0) then
		redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'english', limits - tostring(1))
		  else
		if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>English Words Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال حروف انگلیسی!</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>English Words Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال حروف انگلیسی!</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>English Words Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال حروف انگلیسی!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>English Words Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال حروف انگلیسی!</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>English Words Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال حروف انگلیسی!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
          end
		end
		
		
		
          local is_fosh_msg = msg.content_.text_:find("کير") or msg.content_.text_:find("کص") or msg.content_.text_:find("کون") or msg.content_.text_:find("85") or msg.content_.text_:find("جنده") or msg.content_.text_:find("ننه") or msg.content_.text_:find("ننت") or msg.content_.text_:find("مادر") or msg.content_.text_:find("قهبه") or msg.content_.text_:find("گايي") or msg.content_.text_:find("سکس") or msg.content_.text_:find("kir") or msg.content_.text_:find("kos") or msg.content_.text_:find("kon") or msg.content_.text_:find("nne") or msg.content_.text_:find("nnt")

          if redis:hget(chat_id, 'lock_fosh:megacreed') and is_fosh_msg and (not is_mod(msg) or not is_allowed(msg)) then
		  		  -- setlimit
		limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'fosh') or tostring(0)
		print(limits)
		if limits > tostring(0) then
		redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'fosh', limits - tostring(1))
		  else

		if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Badwords Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال فحش!</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Badwords Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال فحش!</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Badwords Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال فحش!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Badwords Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال فحش!</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Badwords Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال فحش!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
          end
		end
		
		

is_emoji_msg = msg.content_.text_:find("😀") or msg.content_.text_:find("😬") or msg.content_.text_:find("😁") or msg.content_.text_:find("😂") or  msg.content_.text_:find("😃") or msg.content_.text_:find("😄") or msg.content_.text_:find("😅") or msg.content_.text_:find("☺️") or msg.content_.text_:find("🙃") or msg.content_.text_:find("🙂") or msg.content_.text_:find("😊") or msg.content_.text_:find("😉") or msg.content_.text_:find("😇") or msg.content_.text_:find("😆") or msg.content_.text_:find("😋") or msg.content_.text_:find("😌") or msg.content_.text_:find("😍") or msg.content_.text_:find("😘") or msg.content_.text_:find("😗") or msg.content_.text_:find("😙") or msg.content_.text_:find("😚") or msg.content_.text_:find("🤗") or msg.content_.text_:find("😎") or msg.content_.text_:find("🤓") or msg.content_.text_:find("🤑") or msg.content_.text_:find("😛") or msg.content_.text_:find("😏") or msg.content_.text_:find("😶") or msg.content_.text_:find("😐") or msg.content_.text_:find("😑") or msg.content_.text_:find("😒") or msg.content_.text_:find("🙄") or msg.content_.text_:find("🤔") or msg.content_.text_:find("😕") or msg.content_.text_:find("😔") or msg.content_.text_:find("😡") or msg.content_.text_:find("😠") or msg.content_.text_:find("😟") or msg.content_.text_:find("😞") or msg.content_.text_:find("😳") or msg.content_.text_:find("🙁") or msg.content_.text_:find("☹️") or msg.content_.text_:find("😣") or msg.content_.text_:find("😖") or msg.content_.text_:find("😫") or msg.content_.text_:find("😩") or msg.content_.text_:find("😤") or msg.content_.text_:find("😲") or msg.content_.text_:find("😵") or msg.content_.text_:find("😭") or msg.content_.text_:find("😓") or msg.content_.text_:find("😪") or msg.content_.text_:find("😥") or msg.content_.text_:find("😢") or msg.content_.text_:find("🤐") or msg.content_.text_:find("😷") or msg.content_.text_:find("🤒") or msg.content_.text_:find("🤕") or msg.content_.text_:find("😴") or msg.content_.text_:find("💋") or msg.content_.text_:find("❤️")

          if redis:hget(chat_id, 'lock_emoji:megacreed') and is_emoji_msg and (not is_mod(msg) or not is_allowed(msg))  then
		  -- setlimit
		limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'emoji') or tostring(0)
		print(limits)
		if limits > tostring(0) then
		redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'emoji', limits - tostring(1))
		  else
if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Emoji Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال شکلک!</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Emoji Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال شکلک!</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Emoji Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال شکلک!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Emoji Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال شکلک!</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Emoji Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال شکلک!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
          end
		  end
	end
	

	     local _nl, ctrl_chars = string.gsub(msg.content_.text_, "%c", "")
            local _nl, real_digits = string.gsub(msg.content_.text_, "%d", "")
            if redis:hget(chat_id, 'lock_spam:megacreed')  and  tonumber(string.len(msg.content_.text_)) > 	tonumber(redis:get('maxspam:megacreed'..msg.chat_id_)) and (not is_mod(msg) or not is_allowed(msg))  then
-- setlimit
		limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'spam') or tostring(0)
		print(limits)
		if limits > tostring(0) then
		redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'spam', limits - tostring(1))
		  else
		if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Long Message[Spam] Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال پیام طولانی!</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Long Message[Spam] Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال پیام طولانی!</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Long Message[Spam] Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال پیام طولانی!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Long Message[Spam] Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال پیام طولانی!</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Long Message[Spam] Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال پیام طولانی!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
			end
	end
	
	
	
 local _nl, ctrl_chars = string.gsub(msg.content_.text_, "%c", "")
            local _nl, real_digits = string.gsub(msg.content_.text_, "%d", "")
            if redis:hget(chat_id, 'lock_shortmsg:megacreed')  and  string.len(msg.content_.text_) < tonumber(redis:get('shortmsgmax:megacreed'..msg.chat_id_)) and (not is_mod(msg) or not is_allowed(msg))  then
-- setlimit
		limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'shortmsg') or tostring(0)
		print(limits)
		if limits > tostring(0) then
		redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'shortmsg', limits - tostring(1))
		  else
		if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Short Message Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال پیام کوتاه !</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						tdcli.deleteMessages(chat_id, {[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Short Message Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال پیام کوتاه !</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Short Message Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال پیام کوتاه !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Short Message Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال پیام کوتاه !</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(chat_id, {[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Short Message Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال پیام کوتاه !</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
            end
			end

        --AntiFlood

  if redis:hget(chat_id, 'lock_flood:megacreed') then
    local hash = 'user:'..msg.sender_user_id_..':msgs'
    local msgs = tonumber(redis:get(hash) or 0)
     local user = msg.sender_user_id_
	local chat = msg.chat_id_
if not redis:get('floodnum:megacreed'..msg.chat_id_) then
          NUM_MSG_MAX = tonumber(5)
        else
          NUM_MSG_MAX = tonumber(redis:get('floodnum:megacreed'..msg.chat_id_))
        end
if not redis:get('floodtime:megacreed'..msg.chat_id_) then
          TIME_CHECK = tonumber(5)
        else
          TIME_CHECK = tonumber(redis:get('floodtime:megacreed'..msg.chat_id_))
        end
    if msgs > NUM_MSG_MAX then
  if (is_mod(msg) or is_allowed(msg)) then
    return
  end
if redis:get('sender:'..user..':flood') then
return
else
-- setlimit
		limits = redis:hget(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'flood') or tostring(0)
		print(limits)
		if limits > tostring(0) then
		redis:hset(msg.chat_id_..'limit:megacreed:media'..msg.sender_user_id_ , 'flood', limits - tostring(1))
		  else
                 if redis:get('setlock:megacreed'..msg.chat_id_) == "kick" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Flood Message Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال پیام رگباری!</code>"
							end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')

				tdcli.deleteMessages(msg.chat_id_,{[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "warn" then
				redis:incr('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
				
					if tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)) > tonumber(redis:get('warnmax:megacreed'..msg.chat_id_) - 1) then
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "kick" then
						chat_kick(msg.chat_id_, msg.sender_user_id_)
						redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
						tdcli.deleteMessages(msg.chat_id_,{[0] = msg.id_})
						if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Kicked !</b>\nReason : <code>Flood Message Sent !</code>"
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> اخراج شد</b>\n علت : <code>ارسال پیام رگباری!</code>"
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
						end
						if redis:get('setwarn:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(msg.chat_id_,{[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Flood Message Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال پیام رگباری!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
				redis:del('warns:megacreed'..msg.chat_id_..msg.sender_user_id_)
					else
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> You Get Warned !</b>\nReason : <code>Flood Message Sent !</code>\nYour Warns : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).." \n<b> شما یک اخطار گرفتید !</b>\n علت : <code>ارسال پیام رگباری!</code>\nتعداد اخطار های شما : "..(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) or 0 )
							end
						sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				tdcli.deleteMessages(msg.chat_id_,{[0] = msg.id_})
				end
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "del" then

				tdcli.deleteMessages(msg.chat_id_,{[0] = msg.id_})
				end
				if redis:get('setlock:megacreed'..msg.chat_id_) == "ban" then
				chat_kick(msg.chat_id_, msg.sender_user_id_)
				redis:incr('kicks:user:megacreed'..msg.sender_user_id_)
				tdcli.deleteMessages(msg.chat_id_,{[0] = msg.id_})
					if redis:hget(msg.chat_id_, 'lang:megacreed') == "en" then
						text = "User : "..get_info(msg.sender_user_id_).." <b> Has been Banned</b>\nReason : <code>Flood Message Sent !</code>"
					else
						text = "کاربر : \n"..get_info(msg.sender_user_id_).."\n <b> مسدود شد</b>\n علت : <code>ارسال پیام رگباری!</code>"
					end
				sendmsg(chat_id, 0, 0, 1, nil, text, 1, 'html')
				redis:sadd('bot:banned:megacreed'..msg.chat_id_, msg.sender_user_id_)
				end
    end
	end
	redis:setex('sender:'..user..':flood', 30, true)
end
    redis:setex(hash, TIME_CHECK, msgs+1)
      end
	  
	  
		if not redis:get('warnmax:megacreed'..msg.chat_id_) then
			NUM_MSGWARN_MAX = tonumber(3)
			else
			NUM_MSGWARN_MAX = tonumber(redis:get('warnmax:megacreed'..msg.chat_id_))
			end
		if not redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) then
			warnsuser = tonumber(0)
			else
			warnsuser = tonumber(redis:get('warns:megacreed'..msg.chat_id_..msg.sender_user_id_) )
        end


          ------------------------------------------------------


if msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatJoinByLink"  then

    if msg.content_.members_.username_ and msg.content_.members_.username_:find("[Bb][Oo][Tt]$") then
      if redis:hget(chat_id, 'lock_bots:megacreed') then
     chat_kick(msg.chat_id_, msg.content_.members_.id_)
     return false
    end
   end
   
   local statswelcome = io.popen("curl http://api.gpmod.ir/time/"):read("*all")
local timeFA = json.decode(statswelcome).FAtime
local dateFA = json.decode(statswelcome).FAdate

      if redis:get('welcome:gp:megacreed'..msg.chat_id_) and ( redis:ttl('welcome:time'..msg.chat_id_) == 0 or redis:ttl('welcome:time'..msg.chat_id_) < 0 ) then
      local welcome = redis:get('welcome:msg:megacreed'..msg.chat_id_)
      sendmsg(msg.chat_id_, msg.id_, 0, 1, nil, welcome..'\nزمان ورود :'..timeFA..'\nتاریخ ورود :'..dateFA , 1, 'md')
      redis:setex('welcome:time'..msg.chat_id_ , 1200, true)
      end
end








---------------------------------------------------
       elseif (data.ID == "UpdateMessageEdited") then
   local msg = data
  -- vardump(msg)
    if msg.sender_user_id_ and (msg.sender_user_id_  == bot_id) then
       return false
    end
	------------------------------------------------------------------------
  	function get_msg_contact(extra, result, success)
	local text = (result.content_.text_ or result.content_.caption_)
    --vardump(result)
	if result.id_ and result.content_.text_ then
	redis:set('bot:editid:megacreed'..result.id_,result.content_.text_)
	end
    if not redis:sismember('promotes:megacreed'..result.chat_id_, result.sender_user_id_) then
   if (text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]")) and redis:hget(result.chat_id_ ,'lock_links:megacreed') then
    local msgs = {[0] = data.message_id_}
       delete_msg(msg.chat_id_,msgs)
   end
   	if (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) and redis:get('mute_weblink:megacreed'..result.chat_id_) then
    local msgs = {[0] = data.message_id_}
       delete_msg(msg.chat_id_,msgs)
   end
   if text:match("@") and redis:hget(result.chat_id_ ,'lock_username:megacreed') then
    local msgs = {[0] = data.message_id_}
       delete_msg(msg.chat_id_,msgs)
   end
   	if text:match("#") and redis:hget(result.chat_id_ ,'lock_tag:megacreed') then
    local msgs = {[0] = data.message_id_}
       delete_msg(msg.chat_id_,msgs)
	end
   	if text:match("[\216-\219][\128-\191]") and redis:hget(result.chat_id_ ,'lock_persian:megacreed') then
    local msgs = {[0] = data.message_id_}
       delete_msg(msg.chat_id_,msgs)
   end
   if text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") and redis:hget(result.chat_id_ ,'lock_english:megacreed') then
    local msgs = {[0] = data.message_id_}
       delete_msg(msg.chat_id_,msgs)
   end
	end
end
    getMessage(msg.chat_id_, msg.message_id_,get_msg_contact)
if redis:get('lock_edit:megacreed'..msg.chat_id_)then
        local id = msg.message_id_
        local msgs = {[0] = id}
        local chat = msg.chat_id_
              delete_msg(chat,msgs)
	end
	if redis:get('editmsg:megacreed'..msg.chat_id_) == 'didam' then
	if redis:get('bot:editid:megacreed'..msg.message_id_) then
		local old_text = redis:get('bot:editid:megacreed'..msg.message_id_)
		if redis:hget(msg.chat_id_, 'lang:megacreed') == "fa" then
		text = '_چرا ادیت میکنی😠\nمن دیدم که گفتی:_\n\n'..old_text..''
		else
		text = '_Why You Edit ?😠\nI Saw That You Say :_\n\n'..old_text..''
	end
	    sendmsg(msg.chat_id_, msg.message_id_, 0,1,nil, text , 1, 'md')
	end
	end
        elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
          tdcli_function ({
            ID="GetChats",
            offset_order_="9223372036854775807",
            offset_chat_id_=0,
            limit_=20
          }, dl_cb, nil)
        end
      end

--------      Mega Creed Bot ! ------------

