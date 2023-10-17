Shery.mouseFollower();
Shery.makeMagnet(".magnet");
Shery.hoverWithMediaCircle(".hvr", {
  videos: ["./0.mp4", "./2.mp4", "./3.mp4"],
});
gsap.to(".fleftelm", {
  scrollTrigger: {
    trigger: "#fimages",
    pin: true,
    start: "top top",
    end: "bottom bottom",
    endTrigger: ".last",
    scrub: 1,
  },
  y: "-300%",
  ease: Power1,
});

gsap.registerPlugin(ScrollTrigger);

let container = document.querySelector(".slides"),
  slides = gsap.utils.toArray(".slide"),
  getRatio = (el) =>
    window.innerHeight / (window.innerHeight + el.offsetHeight);

slides.forEach((slide, i) => {
  let bg = slide.querySelector(".background"),
    content = slide.querySelector(".content"),
    tl = gsap.timeline({
      scrollTrigger: {
        trigger: slide,
        start: () => (i ? "top bottom" : "top top"),
        end: "bottom top",
        scrub: true,
        invalidateOnRefresh: true,
      },
    });

  tl.fromTo(
    bg,
    {
      y: () => (i ? -window.innerHeight + 20 * getRatio(slide) : 0),
    },
    {
      y: () => window.innerHeight + 20 * (1 - getRatio(slide)),
      ease: "none",
    }
  );
  tl.fromTo(
    content,
    {
      y: () => (i ? -window.innerHeight * 0.5 * getRatio(slide) : 0),
    },
    {
      y: () => window.innerHeight * (1 - getRatio(slide)),
      ease: "none",
    },
    0
  );
});
