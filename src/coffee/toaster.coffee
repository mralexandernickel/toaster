window.µ = window.µ or {}

vars =
  container: null
  states: ["default","info","success","warn","danger"]
  duration: 5000

methods =
  init: (options) ->
    unless vars.container
      vars.container = document.createElement "div"
      vars.container.classList.add "toaster"
      document.body.appendChild vars.container
  add_toast: (priority, text) ->
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
      , vars.duration
    , 1

µ.toaster = (method,options...) ->
  if methods[method]
    methods[method] options
  else if vars.states.indexOf(method) >= 0
    methods.add_toast method, options[0]
  else if typeof method is "object" or not method
    methods.init arguments
  else
    console.log "so WHAT EXACTLY you want me to do now, huh?!...."
 
µ.toaster()

document.body.addEventListener "click", (e) ->
  if e.target.getAttribute("data-toggle") is "toast"
    µ.toaster e.target.getAttribute("data-priority"), e.target.getAttribute("data-message")
