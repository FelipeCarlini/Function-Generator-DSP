var app = new Vue({
	el: '#app',
	data: {
		waveforms: ['Sinusoidal', 'Square', 'Triangle', 'Sawtooth'],
		picked: '',
		parameters: [
			{ name: 'Frequency', unit: 'Hz'},
			{ name: 'Aplitude', unit: 'Vp'},
			{ name: 'Offset', unit: 'V'}
		]
	}
})
