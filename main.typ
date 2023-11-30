#let config = yaml("config.yaml")
#let settings = yaml("settings.yaml")
#let personnal = yaml("personnal.yaml")

#show link: set text(blue)

#show heading: h => [
  #set text(
    size: eval(settings.font.size.heading_large),
    font: settings.font.general
  )
  #h
]

#let sidebarSection = {[
  #par(justify: true)[

    #par[
      #set text(
        size: eval(settings.font.size.contacts),
        font: settings.font.minor_highlight,
      )
      

      Email: #link("mailto:" + config.contacts.email)\
      #if (settings.public) {
        [Phone: #link("tel:" + personnal.contacts.phone)\ ]
      }
      #if (config.contacts.at("linkedin", default:false)) {
        [LinkedIn: #link(config.contacts.linkedin)[mikhail-liamets]\ ] 
      }
      GitHub: #link(config.contacts.github)[caffeintazedgaze] \
      Website: #link(config.contacts.website)[caffeintazedgaze] \
      

      #if (settings.public) {
        personnal.contacts.address
      }
    ]
    #line(length: 100%)
  ]

  = Summary

  #par[
    #set text(
        eval(settings.font.size.education_description),
        font: settings.font.minor_highlight,
    )
    A *software engineer* with a confident grasp of *infrastructure*, *system design*, and *DevOps*, now seeking opportunities to excel in the realms of solution architecture.

    Open to roles ranging from *software engineering* to *DevOps/SRE*.
  ]

  = Skills

  #{
    for skill in config.skills [
      #par[
        #set text(
          size: eval(settings.font.size.description),
        )
        #set text(
          // size: eval(settings.font.size.tags),
          font: settings.font.minor_highlight,
        )
        *#skill.name* 
        #linebreak()
        #skill.items.join(" • ")
      ]
    ]
  }
]}

#let mainSection = {[

  // #par[
  //   #set align(center)
  //   #figure(
  //     image("images/Kodak 20 Zanvoort Lumi.jpg", width: 6em),
  //     placement: top,
  //   )
  // ]

  #par[
    #set text(
      size: eval(settings.font.size.heading_huge),
      font: settings.font.general,
    )
    *#config.contacts.name*
  ]

  #par[
    #set text(
      size: eval(settings.font.size.heading),
      font: settings.font.minor_highlight,
      top-edge: 0pt
    )  
    #config.contacts.title
  ]


  = Education

  #{
    for place in config.education [
        #par[
          #set text(
            size: eval(settings.font.size.heading),
            font: settings.font.general
          )
            #place.from – #place.to \
            #link(place.university.link)[#place.university.name]
        ]
        #par[
          #set text(
            eval(settings.font.size.education_description),
            font: settings.font.minor_highlight,
          )
          #place.degree #place.major \
          #if (place.at("track") != "None"){
            [#place.track]
          }
        ]
    ]
  }

  = Experience

  #{
    for job in config.jobs [
      #par(justify: false)[
        #set text(
          size: eval(settings.font.size.heading),
          font: settings.font.general
        )
          #job.from – #job.to \
          
          *#job.position*
          #link(job.company.link)[\@  #job.company.name]    
      ]
      #par(
        justify: false,
        leading: eval(settings.paragraph.leading)
      )[
        #set text(
          size: eval(settings.font.size.description),
          font: settings.font.general
        )
        #{
          for point in job.description [
            #h(0.5cm) • #point \
          ]
        }
      ]
      #par(
        justify: true,
        leading: eval(settings.paragraph.leading),
      )[
        #set text(
          size: eval(settings.font.size.tags),
          font: settings.font.minor_highlight
        )
        #{
          let tag_line = job.tags.join(" • ")
          tag_line
        }
      ]
    ]
  }



  = Hackathons

  #{
    for hack in config.hackathons [
      #par(
        justify: true,
        leading: eval(settings.paragraph.leading)
      )[
        #par[
          #set text(
            size: eval(settings.font.size.heading),
            font: settings.font.general
          )
          - #hack.year #hack.from – #hack.to \
            #link(hack.hackathon.link)[#hack.hackathon.name] – #link(hack.certificate_link)[Credential]
        ]
        #par[
          #set text(
            size: eval(settings.font.size.description),
            font: settings.font.general
          )
          #hack.description
        ]
      ]
    ]
  }
]}

#{
  grid(
    columns: (2fr, 5fr),
    column-gutter: 3em,
    sidebarSection,
    mainSection,
  )
}
