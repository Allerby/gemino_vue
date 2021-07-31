<template>
  <div class='flex flex-col'>
    <h1 class='text-center text-primary-2 mt-10'>Let’s take a look at your spending</h1>
    <p class='text-center body-1 text-primary-2 mt-4'>We need some information first, this will help us understand your spending habits. <br>Upload your CSV for the last 12 months below</p>

    <div class='flex justify-end items-center mt-24'>
      <h2 class='text-primary-2 mr-4'>
          I also bank with
          I bank with
      </h2>
      <div class='mr-4'>
        <v-select 
          class="gemino"
          :value="selectedBank"
          @input="selectBank"
          :options="options"
          :clearable="false"></v-select>
      </div>

      <div class='overflow-hidden relative group'>
        <button class='btn-primary group-hover:btn-primary-hover transition w-56'>
          <span>Upload CSV</span>
        </button>
        <input class='cursor-pointer group-hover:btn-primary-hover absolute block opacity-0 w-56 left-0 pt-12 top-0' type='file' :value="selectedCsv" v-on:change="upload">
      </div>
    </div>

    <div class='grid grid-cols-2 gap-4 mt-14'>
      <div v-for="upload in csvUploads" :key="upload.id" class='items-center bg-white py-4 px-3 rounded flex'>
        <img src='/icons/ic-csv.png' alt='csv-icon'>
        <span class='text-primary-2 ml-3'>{{upload.filename}}</span>
        <a class='ml-auto cursor-pointer text-primary-2 hover:text-primary-2-hover flex' @click="deleteUpload(upload.id)">
          <svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' width='16' height='16' viewBox='0 0 16 16' >
            <defs>
              <path id='a' d='M9.414 8l6.364 6.364-1.414 1.414L8 9.414l-6.364 6.364-1.414-1.414L6.586 8 .222 1.636 1.636.222 8 6.586 14.364.222l1.414 1.414z'/>
            </defs>
            <use class='fill-current' fill-rule='evenodd' xlink:href='#a'/>
          </svg>
        </a>
      </div>
    </div>

    <div class='flex flex-1 mb-14'>
      <div class='flex flex-col-reverse'>
        <div class='mx-auto'>
          <a href="/" class='btn-secondary hover:btn-secondary-hover inline-block text-center w-56'>Previous</a>
          <button 
            @click="goToCategorise"
            class='btn-primary text-center inline-block hover:btn-primary-hover ml-2 w-56' 
            :disabled="nextIsDisabled">
            Next
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["token", "uploads"],

  data: function() {
    this.csvUploads = JSON.parse(this.uploads)
    this.selectedBank = undefined
    this.selectedCsv = undefined
    
    return {
      options: ['ANZ', 'BNZ', 'Kiwi Bank'],
      selectedBank: this.selectedBank,
      csvUploads: this.csvUploads,
      selectedCsv: this.selectedCsv,
    }
  },

  computed: {
    nextIsDisabled() {
      return this.csvUploads.length == 0
    }
  },

  methods: {
    selectBank(option) {
      this.selectedBank = option
    },
    upload(event) {
      if (event) {
        const csv = event.target.files[0]
        let formData = new FormData()

        formData.append('file', csv)
        formData.append('bank', this.selectedBank)

        this.axios.defaults.headers.common['X-CSRF-TOKEN'] = this._props.token
        this.axios.post('/transactions/upload', formData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        }).then((response) => {
          this.csvUploads.push(response.data)
          this.selectedCsv = undefined
        })
      }
    },
    deleteUpload(uploadId) {
      this.axios.defaults.headers.common['X-CSRF-TOKEN'] = this._props.token
      this.axios.delete(`/transactions/upload/${uploadId}`).then((response) => {
        this.csvUploads = this.csvUploads.filter(csv => csv.id !== response.data.id)
      })
    },
    goToCategorise() {
      window.location = '/categorise'
    },
  }
}
</script>

<style>
  .gemino.v-select {
    height: 48px;
  }

  .gemino.vs--open .vs__dropdown-toggle {
    border-color: #5b53ff;
    border-radius: 2px;
  }

  .gemino .vs__dropdown-toggle {
    width: 288px;
    height: 48px;
    background: #FFF;
    border: 1px solid #e1e1e6;
    border-radius: 2px;
  }

  .gemino .vs__selected {
    height: 40px;
    padding-left: 10px;
  }

  .gemino .vs__dropdown-menu {
    background: #FFF;
    padding: 8px;
    border: 1px solid #e1e1e6;
    top: calc(100%)
  }

  .gemino .vs__actions {
    position: absolute;
    right: 10px;
    top: 16px;
  }

  .gemino .vs__dropdown-option--highlight {
    color: #5b53ff;
    background-color: #FFF;
  }

  .gemino .vs__dropdown-option--selected {
    background: #5b53ff;
    color: #FFF;
  }

  .gemino .vs__dropdown-option {
    padding: 10px 10px;
    line-height: 1.2em;
  }

  .gemino .vs__search {
    border-radius: 2px;
    padding-left: 10px;
  }

  .gemino.vs--open .vs__search {
    padding-left: 10px;
  }
</style>
