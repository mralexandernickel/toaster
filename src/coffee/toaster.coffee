window.µ = window.µ or {}

vars =
  script: null
  container: null
  priorities: ["default","info","success","warn","danger"]
  duration: 5000
  position: "bottom left"

methods =
  #
  # set options...create toaster element
  #
  # @param {Object} Object with options which could be anytime set on init...TODO #maybe
  #
  init: (options) ->
    ts = document.getElementById "ts"
    if ts.getAttribute("data-position")?
      vars.position = ts.getAttribute "data-position"
    if ts.getAttribute("data-duration")?
      vars.duration = parseInt ts.getAttribute("data-duration")
    unless vars.container
      vars.container = document.createElement "div"
      vars.container.className += "toaster #{vars.position}"
      document.body.appendChild vars.container

  #
  # add toast to the toaster
  #
  # @param {String} any string...gets added to the class attribute of toast-element
  # @param {String} the text for the toast
  # @param {Integer} time the toast will appear on the screen...in milliseconds
  #
  add_toast: (priority, text, duration = vars.duration) ->
    toast = document.createElement "div"
    toast.classList.add "toast", "#{priority}", "out"
    toast.textContent = text
    vars.container.appendChild toast
    window.setTimeout ->
      toast.classList.remove "out"
      setTimeout ->
        toast.addEventListener "transitionend", ->
          vars.container.removeChild toast
        toast.classList.add "out"
      , duration
    , 1

µ.toaster = (method,options...) ->
  if methods[method]
    methods[method] options
  else if vars.priorities.indexOf(method) >= 0
    methods.add_toast method, options[0], options[1]
  else if typeof method is "object" or not method
    methods.init arguments
  else
    console.log "so WHAT EXACTLY you want me to do now, huh?!...."
 
document.body.addEventListener "click", (e) ->
  if e.target.getAttribute("data-toggle") is "toast"
    µ.toaster e.target.getAttribute("data-priority"), e.target.getAttribute("data-message"), e.target.getAttribute("data-duration")

µ.toaster()
