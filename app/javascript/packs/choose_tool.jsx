import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const ChooseTool = props => (
  <div class="justify-center">
    <div class="text-center text-primary-2 mt-14">
      <h1>
        How can we help you?
      </h1>
      <p class="mt-1 body-1">
        Choose an option
      </p>
    </div>
    <div class="flex flex-column space-between justify-center mt-10">
      <a class="no-underline bg-white border-2 border-white hover:card-hover rounded transition border-correct">
        <div class="welcome-card rounded text-center text-primary-2 px-8">
          <img
            class="xxl:mt-12 md:mt-6"
            src="/illustrations/img-welcome-1@2x.png"
            alt="track my spending"
          />
          <h2 class="xxl:mt-10 md:mt-6">
            Track my spending
          </h2>
          <p class="mt-2 body-1">
            You’re not ready to start crunching numbers or face how much you actually spend. We help you track how you spend for a bit and create a budget later down the track.
          </p>
        </div>
      </a>
      <a class="no-underline bg-white border-2 border-white hover:card-hover rounded transition ml-4 border-correct">
        <div class="welcome-card rounded text-center text-primary-2 px-8 transition">
          <img
            class="xxl:mt-12 md:mt-6"
            src="/illustrations/img-welcome-2@2x.png"
            alt="create a budget"
          />
          <h2 class="xxl:mt-10 md:mt-6">
            Create a budget
          </h2>
          <p class="mt-2 body-1">
            You’re ready to create a bullet proof budget. We will help you by looking at your spending in the last year and recommend you a budget that you can tailor to your goals.
          </p>
        </div>
      </a>
      <a class="no-underline bg-white border-2 border-white hover:card-hover rounded transition ml-4 border-correct">
        <div class="welcome-card rounded text-center text-primary-2 px-8 transition">
          <img
            class="xxl:mt-12 md:mt-6"
            src="/illustrations/img-welcome-3@2x.png"
            alt="I got this"
          />
          <h2 class="xxl:mt-10 md:mt-6">
            I got this budget thing
          </h2>
          <p class="mt-2 body-1">
            You’re an expert in all number things, you’ve created heaps of budgets before and they’ve all worked out pretty well. You’re just excited that there is a sexy online tool you can now use.
          </p>
        </div>
      </a>
    </div>
    <div class="flex justify-center mt-14">
      <button class='btn-primary w-56 text-center no-underline hover:btn-primary-hover transition'>
        Next
      </button>
    </div>
  </div>
)

ChooseTool.defaultProps = {
  name: 'Michael'
}

ChooseTool.propTypes = {
  name: PropTypes.string
}

document.addEventListener('turbolinks:load', () => {
  const mountPoint = document.getElementById('choose-tool')
  ReactDOM.render(
    <ChooseTool />,
    mountPoint,
  )
})