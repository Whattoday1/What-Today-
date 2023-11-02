document.addEventListener("DOMContentLoaded", function () {
    const prevButton = document.querySelector(".prev");
    const nextButton = document.querySelector(".next");
    const sliderContent = document.querySelector(".slides");
    const slideWidth = 300; // 이미지 너비
    let currentIndex = 0;
    const slideCount = document.querySelectorAll(".slides .box").length;
    const maxIndex = slideCount - 1;
  
    prevButton.addEventListener("click", () => {
      if (currentIndex > 0) {
        currentIndex--;
        updateSlider();
      }
    });
  
    nextButton.addEventListener("click", () => {
      if (currentIndex < maxIndex) {
        currentIndex++;
        updateSlider();
      }
    });
  
    function updateSlider() {
      const translateX = -currentIndex * slideWidth;
      sliderContent.style.transform = `translateX(${translateX}px)`;
  
      // 버튼 위치 고정
      prevButton.style.left = `${currentIndex > 0 ? 10 : -100}px`;
      nextButton.style.right = `${currentIndex < maxIndex ? 10 : -100}px`;
    }
  
    // 초기 버튼 위치 설정
    prevButton.style.position = "absolute";
    prevButton.style.left = currentIndex > 0 ? "10px" : "-100px";
    prevButton.style.bottom = "10px";
  
    nextButton.style.position = "absolute";
    nextButton.style.right = "10px";
    nextButton.style.bottom = "10px";
  });