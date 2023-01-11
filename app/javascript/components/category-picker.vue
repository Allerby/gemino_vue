<template>
  <div class="flex flex-col">
    <h1 class="text-center text-primary-2 mt-10">
      Categorise your spending
    </h1>
    <p class="text-center body-1 text-primary-2 mt-4">
      Tag your transactions with a category
    </p>
    
    <div class="mt-28" style="width: 584px">
      <div class="flex">
        <div class='flex flex-col justify-center items-center bg-white mt-22 p-16 pb-8 relative rounded'>
          <div class='border border-shade-3 absolute rounded-full w-20 h-20 top-0 bg-white -mt-10 flex items-center'>
            <img src='/icons/ic-gym.png' srcset='/icons/ic-gym@2x.png 2x,/icons/ic-gym@3x.png 3x'
              class='flex mx-auto h-10 w-10' alt='category-icon'>
          </div>
          <div class='py-2 px-4 bg-primary-1 text-white rounded-full'>
            Gym
          </div>
          <p class='text-center body-1 text-primary-2 mt-4 mt-8'>
            We found <a @click="showTransactions()"
              class='font-bold hover:underline cursor-pointer'>2
              transactions</a> with
            the keyword <b class='font-bold'>"Foobar baz"</b><br> We reckon this one comes under
            Gym.
          </p>
          <div class='flex flex-row mt-8'>
            <button class='btn-secondary hover:btn-secondary-hover w-56' @click="chooseCategory">
              Choose another category
            </button>
            <button class='btn-primary hover:btn-primary-hover ml-2 w-56' @click="tag">
              Tag as Gym
            </button>
          </div>
        </div>
      </div>
    </div> 
    <div class="flex flex-1 mb-14">
      <div class="flex w-full flex-col-reverse">
        <div class="mx-auto">
          <button
            class="btn-secondary hover:btn-secondary-hover w-56"
            @click="skipTransaction"
          >
            Skip transaction
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: [""],

  data: function() {
    return {
      
    }
  },

  methods: {
    skipTransaction() {
      console.log('skip')
    },
    showTransactions() {
      console.log('transactions')
    },
    chooseCategory() {
      console.log('chooseCategory')
    },
    tag() {
      console.log('tag')
    },
  }
}
</script>
